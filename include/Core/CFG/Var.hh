#pragma once
#include "Graph.hh"
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>
#include <memory>
#include <string>

struct Var {
  Var() : id(0) {}
  const std::string get_function_name() const {
    return pos->inst->getParent()->getParent()->getName().str();
  }
  int id;           // unique variable identifier
  std::string name; // name of the variable (if found)
  llvm::Type *type; // type
  std::shared_ptr<Arc>
      pos; // position in the program for now it's the function name
};
