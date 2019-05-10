#include "TransformToCFG.hh"
#include <iterator>

TransformToCFG::TransformToCFG()
    : _node_cnt(0), _arc_cnt(0), _var_cnt(0), _func_cnt(0), _cfg() {}

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
    std::shared_ptr<Var> var =
        create_var(llvm::cast<llvm::Value>(inst), arc,
                   llvm::cast<llvm::Value>(inst)->getType());
    _cfg.add_cfg_var(var);
  }
  return arc;
}

std::shared_ptr<Var> TransformToCFG::create_var(llvm::Value *val,
                                                std::shared_ptr<Arc> pos,
                                                llvm::Type *type) {
  std::shared_ptr<Var> var = std::make_shared<Var>();
  var->id = _var_cnt++;
  var->val = val;
  var->pos = pos;
  var->type = type;
  _cfg.add_cfg_var(var);
  return var;
}

std::shared_ptr<Func> TransformToCFG::create_func(
    const std::string &name, std::shared_ptr<Node> entry,
    std::shared_ptr<Node> exit, int pos,
    const std::vector<llvm::Argument *> &args, std::shared_ptr<Var> ret) {
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

CFG TransformToCFG::transform_ir_to_cfg(IR_manip &ir) {
  (void)ir;
  std::shared_ptr<Node> init_entry = create_node(0);
  std::shared_ptr<Node> init_exit = create_node(0);
  llvm::Function *func = ir.get_function_handle("main");
  std::vector<llvm::BasicBlock *> worklist;
  ir.add_BB_to_worklist(func, worklist);
  std::vector<llvm::Instruction *> worklist2;
  for (llvm::Instruction &I : *(*worklist.begin())) {
    worklist2.push_back(&I);
  }
  auto it = worklist2.begin();

  add_inst(init_entry, init_exit, it, it, worklist2.end());
  return std::move(_cfg);
}
