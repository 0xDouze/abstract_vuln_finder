#pragma once
#include "Graph.hh"
#include <llvm/ADT/Twine.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>
#include <memory>
#include <string>

struct Var {
  Var(bool retval = false) : id(0), isRetVal(retval) {}

  const std::string get_var_name() {
    if (isRetVal)
      return llvm::Twine("__ret")
          .concat(llvm::Twine(id))
          .concat(llvm::Twine("_"))
          .concat(llvm::Twine(val->getName()))
          .str();
    return val->getName();
  }
  int id;           // unique variable identifier
  llvm::Value *val; // name of the variable (if found)
  llvm::Type *type; // type
  std::shared_ptr<Arc>
      pos; // position in the program for now it's the function name
  bool isRetVal;
};
