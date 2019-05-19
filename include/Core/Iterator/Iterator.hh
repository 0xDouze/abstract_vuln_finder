#pragma once

#include "CFG.hh"
#include "ConcreteDomain.hh"
#include "Func.hh"
#include <llvm/IR/Instructions.h>

template <typename T, typename V> class Iterator {
public:
  Iterator(const CFG &cfg);
  T &operator()(T &dom);

private:
  void apply_domain_to_cfg_forward(std::shared_ptr<Func>, T &dom);
  void eval_stat(V env, llvm::Instruction *inst, T &dom);
  const CFG &_cfg;
  std::vector<std::shared_ptr<Node>> _dirty_nodes;
};

template <typename T, typename V>
Iterator<T, V>::Iterator(const CFG &cfg) : _cfg(cfg) {}

// I'm forcing the analysis on main for now. Will change in the future
template <typename T, typename V> T &Iterator<T, V>::operator()(T &dom) {
  std::shared_ptr<Func> func;

  for (auto &A : _cfg.get_cfg_funcs())
    if (A->name.find("main") != std::string::npos) {
      func = A;
      break;
    }

  std::cout << (func ? func->name : "empty") << "\n";

  if (func != nullptr)
    apply_domain_to_cfg_forward(func, dom);
  return dom;
}

// Should i want to write in an unbearable way like in the linux kernel, I would
// do the iteration with macros. Not saying my code is any better though haha.
// Will have to change name to set init worklist
template <typename T, typename V>
void Iterator<T, V>::apply_domain_to_cfg_forward(std::shared_ptr<Func> func,
                                                 T &dom) {
  if (func == nullptr)
    return;

  std::shared_ptr<Node> entry_node = func->func_entry;
  std::set<std::shared_ptr<Node>> passed;
  std::vector<std::shared_ptr<Node>> stack;
  for (auto &A : func->args) {
    auto env = dom.init();
    if (auto retval = llvm::dyn_cast<llvm::Value>(A))
      dom.add_var(env, retval->getName());
  }
  while ((entry_node->arc_out.empty() == false) ||
         ((passed.size() < func->bb_cnt) || (stack.empty() == false))) {
    if (entry_node->label != "")
      passed.insert(entry_node);

    for (auto &A : entry_node->arc_out) {
      eval_stat(dom.init(), A->inst, dom);
      stack.push_back(A->node_out);
    }

    if (stack.size() == 0)
      return;

    do {
      entry_node = stack.back();
      stack.pop_back();
    } while ((passed.count(entry_node)) && stack.size() > 0);

    if (passed.count(entry_node) && stack.size() == 0)
      return;
  }
}

// prepare for the if forest :)
template <typename T, typename V>
void Iterator<T, V>::eval_stat(V env, llvm::Instruction *inst, T &dom) {
  if (llvm::isa<llvm::AllocaInst>(inst)) {
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      dom.add_var(env, retval->getName());
  }
}
