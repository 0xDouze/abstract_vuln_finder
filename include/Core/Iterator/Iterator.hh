#pragma once

#include <map>

#include "CFG.hh"
#include "Func.hh"
#include "Graph.hh"
#include <llvm/IR/Instruction.h>

/// @brief Iterator class: This class is used to abstract the
/// cfg with the specified domain.
/// @tparam T: Domain name
template <typename T> class Iterator {
public:
  Iterator(const CFG &cfg);
  Iterator(const CFG &cfg, const std::vector<std::string> &funcs);
  std::map<std::string, T> compute_dom_from_cfg();

  void init_worklist(std::shared_ptr<Func> entry);
  void compute_abstract_domain();
  void compute_abs(const std::string &func_name);
  bool init_stat(const std::string &func_name, std::shared_ptr<Arc> arc);

private:
  using _AbstractValue = typename T::AbstractValue;
  std::map<std::shared_ptr<Node>, _AbstractValue> _node_abs_map;
  std::list<std::shared_ptr<Node>> _worklist;
  std::map<std::string, T> _dom;
  const CFG &_cfg;
  const std::vector<std::string> _funcs_to_ite;
};

#include "Iterator.hxx"
