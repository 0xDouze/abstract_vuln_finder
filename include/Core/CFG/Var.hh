#pragma once
#include "Graph.hh"
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>
#include <memory>
#include <string>

struct Var {
  Var(bool retval = false) : id(0), isRetVal(retval) {}
  const std::string get_function_name() const {
    if (pos == nullptr)
      return nullptr;
    return pos->inst->getParent()->getParent()->getName().str();
  }
  const std::string get_var_name() const { return val->getName(); }
  int id;           // unique variable identifier
  llvm::Value *val; // name of the variable (if found)
  llvm::Type *type; // type
  std::shared_ptr<Arc>
      pos; // position in the program for now it's the function name
  llvm::Instruction *inst; // instruction where it is created
  bool isRetVal;
};
