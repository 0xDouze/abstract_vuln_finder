#pragma once
#include "Graph.hh"
#include <any>
#include <list>
#include <map>
#include <memory>
#include <string>

struct Func {
  Func();
  int id;                             // Unique identifier to function
  std::string name;                   // Name of the function
  int pos;                            // Position in the source
  std::shared_ptr<Node> func_entry;   // Entry node
  std::shared_ptr<Node> func_exit;    // Exit node
  std::vector<llvm::Argument *> args; // Arguments
  std::map<std::shared_ptr<Node>, llvm::Value *> ret_val; // Return value
  std::vector<std::shared_ptr<Arc>> func_calls; // list of calls to the function

  const std::vector<llvm::Argument *> &get_args() const;
  const std::vector<std::shared_ptr<Arc>> &get_func_calls() const;
  void add_arg(llvm::Argument *arg);
  void add_func_call(std::shared_ptr<Arc> call);
};
