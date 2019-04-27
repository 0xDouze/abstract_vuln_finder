#pragma once
#include "Graph.hh"
#include "Func.hh"
#include "Var.hh"

class CFG
{
public:
  CFG();
  const std::list<Var>& get_cfg_vars() const;
  const std::list<Func>& get_cfg_funcs() const;
  const std::list<Node>& get_cfg_nodes() const;
  const std::list<Arc>& get_cfg_arcs() const;
  const Node& get_cfg_init_entry() const;
  const Node& get_cfg_init_exit() const;
  void add_cfg_var(const Var& var);
  void add_cfg_func(const Func& func);
  void add_cfg_node(const Node& node);
  void add_cfg_arc(const Arc& arc);
  void set_cfg_init_entry(const Node& init_entry);
  void set_cfg_init_exit(const Node& init_exit);
private:
  std::list<Var> _cfg_vars; //List of all the variables in the CFG
  std::list<Func> _cfg_funcs; //List of all the functions in the CFG
  std::list<Node> _cfg_nodes; //List of all the nodes in the CFG
  std::list<Arc> _cfg_arcs; //List of all the arcs in the CFG
  Node _cfg_init_entry; //First node of code initializing the global variables
  Node _cfg_init_exit; // Last node of initialization code
};
