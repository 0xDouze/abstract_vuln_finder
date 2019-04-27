#include "CFG.hh"

CFG::CFG()
{
  _cfg_vars.empty();
  _cfg_funcs.empty();
  _cfg_nodes.empty();
  _cfg_arcs.empty();
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

const Node& CFG::get_cfg_init_entry() const
{
  return _cfg_init_entry;
}

const Node& CFG::get_cfg_init_exit() const
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

void CFG::set_cfg_init_entry(const Node& init_entry)
{
  _cfg_init_entry = init_entry;
}

void CFG::set_cfg_init_exit(const Node& init_exit)
{
  _cfg_init_exit = init_exit;
}
