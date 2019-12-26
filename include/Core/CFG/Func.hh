#pragma once
#include "Graph.hh"
#include "Var.hh"
#include <any>
#include <list>
#include <map>
#include <memory>
#include <string>

/// This structure represents a function during the CFG construction
struct Func {
  Func();

  /// Unique identifier to the function
  int id;

  /// Name of the function
  std::string name;

  /// Position in the source (To be done, missing feature in mcsema)
  int pos;

  /// Entry node of the function
  std::shared_ptr<Node> func_entry;

  /// Last node of the function
  std::shared_ptr<Node> func_exit;

  /// List of arguments for the function call
  std::vector<llvm::Argument *> args;

  /// Returned values
  std::vector<std::shared_ptr<Var>> ret_val;

  /// List of all the functions called in this function
  std::vector<std::shared_ptr<Arc>> func_calls;

  /// Basic Block counter. Used for printing check
  unsigned bb_cnt;

  /// Vector of all the variables in the function.
  std::vector<std::shared_ptr<Var>> vars;

  // Usuals
  const std::vector<llvm::Argument *> &get_args() const;
  const std::vector<std::shared_ptr<Arc>> &get_func_calls() const;
  const std::vector<std::shared_ptr<Var>> &get_all_vars() const;
  void add_arg(llvm::Argument *arg);
  void add_func_call(std::shared_ptr<Arc> call);
  void add_var(std::shared_ptr<Var> var);
};
