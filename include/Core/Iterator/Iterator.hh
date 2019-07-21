#pragma once
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
  T compute_dom_from_cfg();

  // private:
  void init_worklist(std::shared_ptr<Func> entry);
  void compute_abstract_domain();
  void compute_abs();
  bool init_stat(std::shared_ptr<Arc> arc);

private:
  using _AbstractValue = typename T::AbstractValue;
  std::map<std::shared_ptr<Node>, _AbstractValue> _node_abs_map;
  std::list<std::shared_ptr<Node>> _worklist;
  T _dom;
  const CFG &_cfg;
};

#include "Iterator.hxx"
