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
    break;
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
      if (llvm::isa<llvm::ReturnInst>(A->inst) == false &&
          llvm::isa<llvm::StoreInst>(A->inst) == false) {
        eval_stat(A->inst);
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
  for (auto &V : _worklist)
    std::cout << V->id << "\n";
  _dom.print_env();
}

// Doing this because we have two other choices: (hate it though)
// either do a switch case on every single IR instructions/opcodes
// or do a specialized visitorInst class. The first one is same/worse than
// the if forest below. The second idea is really not that
// useful for what i am doing and at this point, adds more work
// and OO techniques that are useless for my usecase. If in the
// future someone sees this and has a better idea, i'd love
// to know it, please drop an issue on github :)
template <typename T>
void Iterator<T>::eval_stat(llvm::Instruction *inst)
{
  if (llvm::isa<llvm::AllocaInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::GetElementPtrInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::LoadInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::BinaryOperator>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::PtrToIntInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::IntToPtrInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
      _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::CatchSwitchInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::InvokeInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::TruncInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::ZExtInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::SExtInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::FPToUIInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::FPToSIInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::UIToFPInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::SIToFPInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::FPTruncInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::FPExtInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::BitCastInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::VAArgInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::CleanupPadInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::CatchPadInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::ICmpInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::FCmpInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::PHINode>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::SelectInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::ExtractElementInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::ShuffleVectorInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::ExtractValueInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::InsertElementInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::InsertValueInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
  if (llvm::isa<llvm::CallInst>(inst))
    if (auto retval = llvm::dyn_cast<llvm::Value>(inst))
    _dom.update_env(retval->getName(), _dom.init_abs_val());
}
