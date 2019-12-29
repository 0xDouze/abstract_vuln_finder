#pragma once
#include "Iterator.hh"
#include <llvm/IR/Instructions.h>

/// Constructor for iterator: Will analyze the whole binary
template <typename T>
Iterator<T>::Iterator(const CFG &cfg) :_cfg(cfg){
}

/// Constructor for iterator: Will analyze only the specified
/// functions
template <typename T>
Iterator<T>::Iterator(const CFG &cfg, const std::vector<std::string> &funcs) : _cfg(cfg), _funcs_to_ite(funcs)
{
}

template <typename T>
void Iterator<T>::compute_abs(const std::string& func_name){
  _AbstractValue temp = _dom.at(func_name).init_abs_val();

  while (_worklist.empty() == false)
  {
    auto curr_node = _worklist.front();
    std::vector<_AbstractValue> pred_val;

    _dom.at(func_name).set_bottom(temp);
    _worklist.pop_front();
    for (auto &L : curr_node->arc_in)
        pred_val.push_back(_dom.at(func_name).eval_stat(L));
    for (auto &V : pred_val)
      temp = _dom.at(func_name).join(V, temp);
    if (!_dom.at(func_name).is_equal(temp, _node_abs_map[curr_node])) {
      for (auto &L : curr_node->arc_out)
        _worklist.push_back(L->node_out);
      _node_abs_map[curr_node] = temp;
    }
  }
}

template <typename T>
std::map<std::string, T> Iterator<T>::compute_dom_from_cfg()
{
  std::shared_ptr<Func> entry = nullptr;
  std::vector<std::shared_ptr<Func>> func_list;

  if (_funcs_to_ite.empty())
    for (auto &A : _cfg.get_cfg_funcs())
        func_list.push_back(A);
  else
  {
    auto cfg_funcs = _cfg.get_cfg_funcs();

    for (auto &V : _funcs_to_ite)
    {
      for (auto &A : cfg_funcs)
        if (A->name == V)
        {
          func_list.push_back(A);
          break;
        }
    }
  }

  for (auto &A : func_list)
  {
    entry = A;

    if (entry == nullptr) {
      std::cerr << "Somehow no funcs found in the CFG for: " << A->name << "\n";
      continue;
    }

    std::cout << entry->name << "\n";
    _dom.insert({entry->name, T()});
    init_worklist(entry);

    //compute_abs(entry->name);
    _node_abs_map.clear();
    _worklist.clear();
  }
  return std::move(_dom);
}
template <typename T>
void Iterator<T>::init_worklist(std::shared_ptr<Func> entry)
{
  if (entry == nullptr)
    return;

  _dom.at(entry->name).init_internal_env(entry);
  std::shared_ptr<Node> entry_node = entry->func_entry;
  std::set<std::shared_ptr<Node>> passed;
  std::vector<std::shared_ptr<Node>> stack;

  if (entry_node == nullptr)
    return;
  for (auto &A : entry->args)
  {
    if (auto retval = llvm::dyn_cast<llvm::Value>(A))
      _dom.at(entry->name).update_env(retval->getName().str(), _dom.at(entry->name).init_abs_val());
  }

  while ((entry_node->arc_out.empty() == false) ||
         ((passed.size() < entry->bb_cnt) || (stack.empty() == false))) {
    if (entry_node->label != "")
      passed.insert(entry_node);

    _node_abs_map.insert(std::make_pair(entry_node, _dom.at(entry->name).init_abs_val()));
    _worklist.push_back(entry_node);
    for (auto &A : entry_node->arc_out) {
      init_stat(entry->name, A);
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
bool Iterator<T>::init_stat(const std::string &func_name, std::shared_ptr<Arc> arc)
{
  if (arc->retval != nullptr) {
    _dom.at(func_name).update_env(arc->retval->get_raw_name(), _dom.at(func_name).init_abs_val());
    return true;
  }
  return false;
}
