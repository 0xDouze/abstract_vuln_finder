#pragma once
#include "Iterator.hh"
#include <llvm/IR/Instructions.h>

template <typename T>
Iterator<T>::Iterator(const CFG &cfg) :_dom(), _cfg(cfg){
}

template <typename T>
void Iterator<T>::compute_abs(){
  while (_worklist.empty() == false)
  {
    auto curr_node = _worklist.front();
    _worklist.pop_front();
    for (auto &L : curr_node->arc_in)
      {
        std::vector<_AbstractValue> pred_val;
        pred_val.push_back(_dom.eval_stat(L));
      }
  }
}

// init
// while (_worklist != empty)
// curr_node = join(preds)
// if (curr_node != node)
//  _worklist.push(*succ)
template <typename T>
T Iterator<T>::compute_dom_from_cfg(){
  std::shared_ptr<Func> entry = nullptr;

  for (auto &A : _cfg.get_cfg_funcs())
    if (A->name.find("main") != std::string::npos){
      entry = A;
      break;
    }
  if (entry == nullptr)
    std::cerr << "weird\n";
  std::cout << entry->name << "\n";
  init_worklist(entry);

  compute_abs();
  return std::move(_dom);
}

template <typename T>
void Iterator<T>::init_worklist(std::shared_ptr<Func> entry)
{
  if (entry == nullptr)
    return;

  std::shared_ptr<Node> entry_node = entry->func_entry;
  std::set<std::shared_ptr<Node>> passed;
  std::vector<std::shared_ptr<Node>> stack;

  for (auto &A : entry->args)
  {
    if (auto retval = llvm::dyn_cast<llvm::Value>(A))
      _dom.update_env(retval->getName().str(), _dom.init_abs_val());
  }

  while ((entry_node->arc_out.empty() == false) ||
         ((passed.size() < entry->bb_cnt) || (stack.empty() == false))) {
    if (entry_node->label != "")
      passed.insert(entry_node);

    _worklist.push_back(entry_node);
    for (auto &A : entry_node->arc_out) {
      init_stat(A);
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

template <typename T>
bool Iterator<T>::init_stat(std::shared_ptr<Arc> arc)
{
  if (arc->retval != nullptr) {
    _dom.update_env(arc->retval->get_var_name(), _dom.init_abs_val());
    return true;
  }
  return false;
}
