#include "CFG.hh"

CFG::CFG()
{
  _cfg_vars.empty();
  _cfg_funcs.empty();
  _cfg_nodes.empty();
  _cfg_arcs.empty();
}

CFG::CFG(IR_manip& ir)
{
  _cfg_vars.empty();
  _cfg_funcs.empty();
  _cfg_nodes.empty();
  _cfg_arcs.empty();
  set_cfg_init_entry(ir);
  set_cfg_init_exit(ir);
}

CFG::CFG(IR_manip& ir, const llvm::Function *func)
{
  _cfg_vars.empty();
  _cfg_funcs.empty();
  _cfg_nodes.empty();
  _cfg_arcs.empty();
  (void)ir;
  (void)func;
}

const std::list<Var>& CFG::get_cfg_vars() const
{
  return _cfg_vars;
}

const std::list<Func>& CFG::get_cfg_funcs() const
{
  return _cfg_funcs;
}

const std::list<Node>& CFG::get_cfg_nodes() const
{
  return _cfg_nodes;
}

const std::list<Arc>& CFG::get_cfg_arcs() const
{
  return _cfg_arcs;
}

const std::shared_ptr<Node> CFG::get_cfg_init_entry() const
{
  return _cfg_init_entry;
}

const std::shared_ptr<Node> CFG::get_cfg_init_exit() const
{
  return _cfg_init_exit;
}

void CFG::add_cfg_var(const Var& var)
{
  _cfg_vars.push_back(var);
}

void CFG::add_cfg_func(const Func& func)
{
  _cfg_funcs.push_back(func);
}

void CFG::add_cfg_node(const Node& node)
{
  _cfg_nodes.push_back(node);
}

void CFG::add_cfg_arc(const Arc& arc)
{
  _cfg_arcs.push_back(arc);
}

void CFG::set_cfg_init_entry(std::shared_ptr<Node> init_entry)
{
  _cfg_init_entry = init_entry;
}

void CFG::set_cfg_init_entry(IR_manip& ir)
{
  TransformToCFG ttc;
  ir.print_function(ir.get_function_handle("__mcsema_constructor"));
  _cfg_init_entry = ttc.convert_function_to_node(ir, "__mcsema_constructor");
  llvm::errs() << *(*_cfg_init_entry->arc_out.begin())->inst << "\n";
  llvm::errs() << *(*(*_cfg_init_entry->arc_out.begin())->node_in->arc_out.begin())->inst << "\n";
}
void CFG::set_cfg_init_exit(std::shared_ptr<Node> init_exit)
{
  _cfg_init_exit = init_exit;
}

void CFG::set_cfg_init_exit(IR_manip& ir)
{
  (void)ir;
}
