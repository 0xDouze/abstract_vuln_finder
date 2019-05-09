#pragma once
#include "Graph.hh"
#include <llvm/IR/BasicBlock.h>
#include <memory>
#include <string>
struct Var {
  Var() : id(0), pos(0) {}
  const std::string get_var_function() const {
    return pos->inst->getParent()->getName().str();
  };
  int id;                   // unique variable identifier
  std::string name;         // name of the variable (if found)
  std::string type;         // type
  std::shared_ptr<Arc> pos; // position in the program
};
