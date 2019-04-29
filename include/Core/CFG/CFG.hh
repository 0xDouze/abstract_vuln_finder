#pragma once
#include <map>
#include <list>
#include <string>
#include <memory>
#include "Graph.hh"
#include "Func.hh"
#include "Var.hh"
#include "IR_manip.hh"
#include "TransformToCFG.hh"
class CFG
{
public:
  CFG(); //set empty cfg
  CFG(IR_manip& ir); //create cfg with all the functions
  CFG(IR_manip& ir, const llvm::Function *func); //creates cfg with only the init and the specified function
  const std::list<Var>& get_cfg_vars() const;
  const std::list<Func>& get_cfg_funcs() const;
  const std::list<Node>& get_cfg_nodes() const;
  const std::list<Arc>& get_cfg_arcs() const;
  const std::shared_ptr<Node> get_cfg_init_entry() const;
  const std::shared_ptr<Node> get_cfg_init_exit() const;
  void add_cfg_var(const Var& var);
  void add_cfg_func(const Func& func);
  void add_cfg_node(const Node& node);
  void add_cfg_arc(const Arc& arc);
  void set_cfg_init_entry(std::shared_ptr<Node> init_entry);
  void set_cfg_init_entry(IR_manip& ir);
  void set_cfg_init_exit(std::shared_ptr<Node> init_exit);
  void set_cfg_init_exit(IR_manip& ir);
private:
  std::list<Var> _cfg_vars; //List of all the variables in the CFG
  std::list<Func> _cfg_funcs; //List of all the functions in the CFG
  std::list<Node> _cfg_nodes; //List of all the nodes in the CFG
  std::list<Arc> _cfg_arcs; //List of all the arcs in the CFG
  std::shared_ptr<Node> _cfg_init_entry; //First node of code initializing the global variables
  std::shared_ptr<Node> _cfg_init_exit; // Last node of initialization code
};

