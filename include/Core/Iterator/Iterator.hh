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
  void set_init_worklist(std::shared_ptr<Func>, T &dom);
  void eval_stat(V env, llvm::Instruction *inst, T &dom);
  void invariant_propagation();
  const CFG &_cfg;
  std::vector<std::shared_ptr<Node>> worklist;
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

  if (func != nullptr) {
    set_init_worklist(func, dom);
  }
  invariant_propagation();
  return dom;
}

template <typename T, typename V>
void Iterator<T, V>::set_init_worklist(std::shared_ptr<Func> func, T &dom) {
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

    worklist.push_back(entry_node);
    for (auto &A : entry_node->arc_out) {
      if (llvm::isa<llvm::ReturnInst>(A->inst) == false &&
          llvm::isa<llvm::StoreInst>(A->inst) == false) {
        eval_stat(dom.init(), A->inst, dom);
      }
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
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst)) {
      dom.add_var(env, retval->getName());
      llvm::errs() << *retval->getType() << "\n";
    }
  }
  if (llvm::isa<llvm::GetElementPtrInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      dom.add_var(env, retval->getName());

  if (llvm::isa<llvm::LoadInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      dom.add_var(env, retval->getName());

  if (llvm::isa<llvm::BinaryOperator>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      dom.add_var(env, retval->getName());

  if (llvm::isa<llvm::PtrToIntInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      dom.add_var(env, retval->getName());

  if (llvm::isa<llvm::IntToPtrInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      dom.add_var(env, retval->getName());
}

template<typename T, typename V>
void Iterator<T, V>::invariant_propagation()
{}
