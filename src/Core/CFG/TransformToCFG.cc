#include "TransformToCFG.hh"

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
  arc->node_in = dst;
  arc->node_out = src;
  arc->inst = inst;
  src->arc_in.push_back(arc);
  dst->arc_out.push_back(arc);
  _cfg.add_cfg_arc(arc);
  std::shared_ptr<Var> var =
      create_var(llvm::cast<llvm::Value>(inst), arc,
                 llvm::cast<llvm::Value>(inst)->getType());
  if (llvm::isa<llvm::CallInst>(*inst)) {
    llvm::CallInst *call = llvm::cast<llvm::CallInst>(inst);
    (void)call;
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

CFG TransformToCFG::transform_ir_to_cfg(const IR_manip &ir) {
  (void)ir;
  std::shared_ptr<Node> init_entry = create_node(0);
  std::shared_ptr<Node> init_exit = create_node(0);
  return std::move(_cfg);
}
