#pragma once
#include "Env.hh"
#include "Func.hh"
#include "Graph.hh"
#include "IR_manip.hh"
#include "TransformToCFG.hh"
#include "Var.hh"
#include <fstream>
#include <list>
#include <map>
#include <memory>
#include <string>
#include <unordered_set>

class CFG {
public:
  CFG();             // set empty cfg
  CFG(IR_manip &ir); // create cfg with all the functions
  CFG(IR_manip &ir,
      const std::string &func_name); // creates cfg with only the init and the
                                     // specified function
  const std::unordered_set<std::shared_ptr<Var>> &get_cfg_vars() const;
  const std::unordered_set<std::shared_ptr<Func>> &get_cfg_funcs() const;
  const std::unordered_set<std::shared_ptr<Node>> &get_cfg_nodes() const;
  const std::unordered_set<std::shared_ptr<Arc>> &get_cfg_arcs() const;
  const std::shared_ptr<Node> &get_cfg_init_entry() const;
  const std::shared_ptr<Node> &get_cfg_init_exit() const;
  void add_cfg_var(std::shared_ptr<Var> var);
  void add_cfg_func(std::shared_ptr<Func> func);
  void add_cfg_node(std::shared_ptr<Node> node);
  void add_cfg_arc(std::shared_ptr<Arc> arc);
  void set_cfg_init_entry(std::shared_ptr<Node> init_entry);
  void set_cfg_init_entry(IR_manip &ir);
  void set_cfg_init_exit(std::shared_ptr<Node> init_exit);
  void set_cfg_init_exit(IR_manip &ir);
  // void print(const std::string& func_name);
  void print_init();

private:
  void add_node(struct Env &env, std::shared_ptr<Node> node);
  void add_arc(struct Env &env, std::shared_ptr<Arc> arc);
  void print_arc(std::fstream &file, const std::shared_ptr<Arc> &arc);
  void print_node(std::fstream &file, const std::shared_ptr<Node> &node);
  void set_arcs_and_nodes(struct Env &env);
  // change the unordered_sets for std::unordered_set
  std::unordered_set<std::shared_ptr<Var>>
      _cfg_vars; // List of all the variables in the CFG
  std::unordered_set<std::shared_ptr<Func>>
      _cfg_funcs; // List of all the functions in the CFG
  std::unordered_set<std::shared_ptr<Node>>
      _cfg_nodes; // List of all the nodes in the CFG
  std::unordered_set<std::shared_ptr<Arc>>
      _cfg_arcs; // List of all the arcs in the CFG
  std::shared_ptr<Node>
      _cfg_init_entry; // First node of code initializing the global variables
  std::shared_ptr<Node> _cfg_init_exit; // Last node of initialization code
};
