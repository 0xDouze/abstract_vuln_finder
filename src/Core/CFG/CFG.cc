#include "CFG.hh"
CFG::CFG() {}

CFG::CFG(IR_manip &ir) {
  set_cfg_init_entry(ir);
  set_cfg_init_exit(ir);
}

CFG::CFG(IR_manip &ir, const llvm::Function *func) {
  (void)ir;
  (void)func;
}

const std::list<Var> &CFG::get_cfg_vars() const { return _cfg_vars; }

const std::list<Func> &CFG::get_cfg_funcs() const { return _cfg_funcs; }

const std::list<Node> &CFG::get_cfg_nodes() const { return _cfg_nodes; }

const std::list<Arc> &CFG::get_cfg_arcs() const { return _cfg_arcs; }

const std::shared_ptr<Node> CFG::get_cfg_init_entry() const {
  return _cfg_init_entry;
}

const std::shared_ptr<Node> CFG::get_cfg_init_exit() const {
  return _cfg_init_exit;
}

void CFG::add_cfg_var(const Var &var) { _cfg_vars.push_back(var); }

void CFG::add_cfg_func(const Func &func) { _cfg_funcs.push_back(func); }

void CFG::add_cfg_node(const Node &node) { _cfg_nodes.push_back(node); }

void CFG::add_cfg_arc(const Arc &arc) { _cfg_arcs.push_back(arc); }

void CFG::set_cfg_init_entry(std::shared_ptr<Node> init_entry) {
  _cfg_init_entry = init_entry;
}

void CFG::set_cfg_init_entry(IR_manip &ir) {
  TransformToCFG ttc;
  _cfg_init_entry = ttc.convert_function_to_node(ir, "__mcsema_constructor");
  if (_cfg_init_entry == nullptr)
    return; // Fix : Make node from default function constructor
  llvm::errs() << *(*_cfg_init_entry->arc_out.begin())->inst << "\n";
  llvm::errs()
      << *(*(*_cfg_init_entry->arc_out.begin())->node_in->arc_out.begin())->inst
      << "\n";
}
void CFG::set_cfg_init_exit(std::shared_ptr<Node> init_exit) {
  _cfg_init_exit = init_exit;
}

void CFG::set_cfg_init_exit(IR_manip &ir) {
  TransformToCFG ttc;
  _cfg_init_exit = ttc.convert_function_to_node(ir, "__mcsema_destructor");
  if (_cfg_init_exit == nullptr)
    return; // Fix: Make node from default function destructor
  llvm::errs() << *(*_cfg_init_exit->arc_out.begin())->inst << "\n";
  llvm::errs()
      << *(*(*_cfg_init_exit->arc_out.begin())->node_out->arc_out.begin())->inst
      << "\n";
}
