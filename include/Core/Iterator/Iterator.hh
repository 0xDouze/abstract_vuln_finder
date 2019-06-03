#pragma once
#include "CFG.hh"
#include "Func.hh"
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
  void eval_stat(llvm::Instruction *inst);
  void compute_abs();

private:
  using _AbstractValue = typename T::AbstractValue;
  std::map<Node, _AbstractValue> _abs_map;
  std::vector<std::shared_ptr<Node>> _worklist;
  T _dom;
  const CFG &_cfg;
};

#include "Iterator.hxx"
