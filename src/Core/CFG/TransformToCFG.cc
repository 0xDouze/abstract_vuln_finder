#include "TransformToCFG.hh"
#include <algorithm>
#include <iterator>

TransformToCFG::TransformToCFG(IR_manip &ir)
    : _node_cnt(0), _arc_cnt(0), _var_cnt(0), _func_cnt(0), _ir(ir), _cfg() {
  set_constructor();
}

void TransformToCFG::translate_func_to_cfg(llvm::Function *func,
                                           std::shared_ptr<Node> entry,
                                           std::shared_ptr<Node> exit) {
  std::shared_ptr<struct Env> env = std::make_shared<struct Env>();
  std::vector<llvm::BasicBlock *> blocks;
  std::vector<llvm::Argument *> args;
  std::vector<std::shared_ptr<Var>> retval;
  std::shared_ptr<Func> func_desc;

  _ir.add_BB_to_worklist(func, blocks);

  func_desc = create_func(func->getName(), entry, exit, 0, args, retval);
  _func_envs.push_back(std::make_pair(env, func_desc));
  get_data_pass(func_desc, blocks);
  // create_graph_pass();
}

void TransformToCFG::set_constructor() {
  std::shared_ptr<Node> init_entry = create_node(0);
  std::shared_ptr<Node> init_exit = create_node(0);
  _cfg.set_cfg_init_entry(init_entry);
  _cfg.set_cfg_init_exit(init_exit);

  // will need to be modified in due time, but for now it's ok
  llvm::Function *func = _ir.get_function_handle("main");
  if (func == nullptr)
    return;

  translate_func_to_cfg(func, init_entry, init_exit);
  for (auto &F : _func_envs) {
    auto &env = F.first;
    std::cout << "\n\nprint func name " << F.second->name << "\n";
    for (auto &V : env->env_vars)
      std::cout << "print var name " << V->get_var_name() << "\n";
  }
}

static bool compare_function(llvm::Function *func1, llvm::Function *func2) {
  return func1->getName().equals(func2->getName());
}

// i dont think we'll have to handle storeinsts, we should be able to use the
// Use class to do that. Not sure if it will work.
void TransformToCFG::set_func_env_var(std::shared_ptr<struct Env> env,
                                      llvm::Instruction &inst) {
  llvm::Value *val = llvm::cast<llvm::Value>(&inst);
  if (val == nullptr)
    return;

  else if (std::find_if(env->env_vars.begin(), env->env_vars.end(),
                        [val](std::shared_ptr<Var> v) -> bool {
                          return v->get_var_name() == val->getName();
                        }) != env->env_vars.end() &&
           val->getName() != "")
    return;

  else {
    std::shared_ptr<Var> var;
    if (auto *R = llvm::dyn_cast<llvm::ReturnInst>(&inst)) {
      if (R->getReturnValue() == nullptr)
        return;
      else
        var = create_var(R->getReturnValue(), nullptr, R->getType(), true);
    } else if (val->getName() != "")
      var = create_var(val, nullptr, val->getType());
    else
      return;
    env->env_vars.push_back(var);
  }
}
void TransformToCFG::get_data_pass(std::shared_ptr<Func> func_desc,
                                   std::vector<llvm::BasicBlock *> blocks) {
  std::shared_ptr<struct Env> env = nullptr;
  for (auto &E : _func_envs)
    if (func_desc == E.second)
      env = E.first;
  if (env == nullptr) {
    llvm::errs() << "Couldn't find function" << func_desc->name
                 << "in cfg environnement, an error occured internally\n";
    return;
  }

  for (auto &BB : blocks) {
    if (BB->hasName())
      env->block_labels.insert(std::make_pair(BB->getName(), BB));
    for (llvm::Instruction &I : *BB) {
      set_func_env_var(env, I);
      if (llvm::isa<llvm::CallInst>(I)) {
        llvm::CallInst *callinst = llvm::cast<llvm::CallInst>(&I);
        llvm::Function *called_func = callinst->getCalledFunction();
        if (called_func == NULL)
          continue;
        env->call_list.push_back(callinst->getCalledFunction());
      }
    }
  }

  std::sort(env->call_list.begin(), env->call_list.end(), compare_function);
  auto last = std::unique(env->call_list.begin(), env->call_list.end());
  env->call_list.erase(last, env->call_list.end());
  for (auto &F : env->call_list) {
    bool exists = false;
    for (auto &Func_env : _cfg.get_cfg_funcs())
      if ((exists = F->getName().equals(Func_env->name)))
        break;

    if (exists)
      continue;
    std::shared_ptr<Node> entry = create_node(0);
    std::shared_ptr<Node> exit = create_node(0);
    translate_func_to_cfg(F, entry, exit);
  }
}

std::shared_ptr<Node> TransformToCFG::create_node(int pos) {
  std::shared_ptr<Node> node = std::make_shared<Node>();
  node->id = _node_cnt++;
  node->pos = pos;
  _cfg.add_cfg_node(node);
  return node;
}

std::shared_ptr<Arc> TransformToCFG::create_arc(std::shared_ptr<Node> src,
                                                std::shared_ptr<Node> dst,
                                                llvm::Instruction *inst) {
  std::shared_ptr<Arc> arc = std::make_shared<Arc>();
  arc->id = _arc_cnt++;
  arc->node_in = src;
  arc->node_out = dst;
  arc->inst = inst;
  dst->arc_in.push_back(arc);
  src->arc_out.push_back(arc);
  _cfg.add_cfg_arc(arc);

  if (llvm::isa<llvm::CallInst>(*inst)) {
    llvm::CallInst *call = llvm::cast<llvm::CallInst>(inst);
    (void)call;
  }

  if (llvm::cast<llvm::Value>(inst)->getName() != "") {
    std::shared_ptr<Var> var = nullptr;
    for (auto &V : _cfg.get_cfg_vars()) {
      if (V->val == llvm::cast<llvm::Value>(inst)) {
        var = V;
        var->pos = arc;
      }
    }

    if (var == nullptr) {
      var = create_var(llvm::cast<llvm::Value>(inst), arc,
                       llvm::cast<llvm::Value>(inst)->getType());
      _cfg.add_cfg_var(var);
    }
  }
  return arc;
}

std::shared_ptr<Var> TransformToCFG::create_var(llvm::Value *val,
                                                std::shared_ptr<Arc> pos,
                                                llvm::Type *type,
                                                bool isRetVal) {
  std::shared_ptr<Var> var = std::make_shared<Var>();
  var->id = _var_cnt++;
  var->val = val;
  var->pos = pos;
  var->type = type;
  var->isRetVal = isRetVal;
  _cfg.add_cfg_var(var);
  return var;
}

std::shared_ptr<Func>
TransformToCFG::create_func(const std::string &name,
                            std::shared_ptr<Node> entry,
                            std::shared_ptr<Node> exit, int pos,
                            const std::vector<llvm::Argument *> &args,
                            std::vector<std::shared_ptr<Var>> ret) {
  std::shared_ptr<Func> func = std::make_shared<Func>();
  func->id = _func_cnt++;
  func->name = name;
  func->pos = pos;
  func->func_entry = entry;
  func->func_exit = exit;
  func->args = args;
  func->ret_val = ret;
  _cfg.add_cfg_func(func);
  return func;
}

std::vector<llvm::Instruction *>::iterator &TransformToCFG::add_inst(
    std::shared_ptr<Node> entry, std::shared_ptr<Node> exit,
    const std::vector<llvm::Instruction *>::iterator &begin,
    std::vector<llvm::Instruction *>::iterator &curr,
    const std::vector<llvm::Instruction *>::iterator &end) {
  if (curr == end)
    return curr;
  else if ((std::next(curr, 1) == end)) {
    std::cout << entry->id << " " << exit->id << " ici next\n";
    create_arc(entry, exit, *curr);
  } else {
    std::cout << "ici pas next " << entry->id << "\n";
    std::shared_ptr<Node> next = create_node(0);
    create_arc(entry, next, *curr);
    std::advance(curr, 1);
    add_inst(next, exit, begin, curr, end);
  }
  return curr;
}

std::shared_ptr<Node> TransformToCFG::append_inst(
    std::shared_ptr<Node> entry,
    std::vector<llvm::Instruction *>::iterator &begin,
    const std::vector<llvm::Instruction *>::iterator &end) {

  if (begin == end)
    return entry;
  else {
    std::shared_ptr<Node> next = create_node(0);
    create_arc(entry, next, *begin);
    std::advance(begin, 1);
    return append_inst(next, begin, end);
  }
}

std::shared_ptr<Node> TransformToCFG::prepend_inst(
    std::shared_ptr<Node> exit,
    std::vector<llvm::Instruction *>::iterator &begin,
    const std::vector<llvm::Instruction *>::iterator &end) {

  if (begin == end)
    return exit;
  else {
    std::shared_ptr<Node> prev = create_node(0);
    create_arc(prev, exit, *begin);
    std::advance(begin, 1);
    return prepend_inst(prev, begin, end);
  }
}

CFG TransformToCFG::transform_ir_to_cfg() {
  std::shared_ptr<Node> init_entry = create_node(0);
  std::shared_ptr<Node> init_exit = create_node(0);

  //  llvm::Function *func = ir.get_function_handle("main");
  //  std::vector<llvm::BasicBlock *> worklist;
  //  ir.add_BB_to_worklist(func, worklist);
  //  std::vector<llvm::Instruction *> worklist2;
  //  for (llvm::Instruction &I : *(*worklist.begin())) {
  //    worklist2.push_back(&I);
  //  }
  //  auto it = worklist2.begin();
  //
  //  add_inst(init_entry, init_exit, it, it, worklist2.end());
  return std::move(_cfg);
}
