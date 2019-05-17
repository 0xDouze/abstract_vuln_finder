#pragma once
#include "Func.hh"
#include "Graph.hh"
#include "Var.hh"
#include <list>
#include <llvm/ADT/StringMap.h>
#include <llvm/IR/Function.h>
#include <map>
#include <string>
#include <unordered_map>
#include <vector>

/// This structure contains every possible data wanted during the
/// translation from IR to CFG
///
/// Note: This structure is based on something that is useful
/// when parsing C files. As we are doing this on IR, not
/// every containers are set during the translation
struct Env {

  /// map of all variables in the function
  std::vector<std::shared_ptr<Var>> env_vars;

  /// Map of all visible functions in the "scope" (function)
  std::vector<std::shared_ptr<Func>> env_func;

  /// Node to go to after terminator instruction
  std::shared_ptr<Node> env_exit;

  /// List of all the calls in the current function in
  /// the form of llvm::Function pointers
  std::vector<llvm::Function *> call_list;

  /// Variables that contain the returned value if the
  /// terminator is a ReturnInst. Not used.
  std::vector<std::shared_ptr<Var>> env_return;

  /// Map of all the basic blocks. Given a name, it will
  /// return a basic block pointer
  std::map<std::string, llvm::BasicBlock *> block_labels;

  /// Map of all the basic blocks. Given a name, it will
  /// return a pointer to a Node structure
  std::map<std::string, std::shared_ptr<Node>> env_labels;

  /// Map of all the gotos. Not used.
  std::map<std::string, std::shared_ptr<Node>>
      env_gotos; // list of gotos contains Node and the name of the label
};
