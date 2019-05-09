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
// may need to change the Nodes, we'll see
struct Env {
  std::vector<std::shared_ptr<Var>>
      env_vars; // map of all variables in the function
  std::vector<std::shared_ptr<Func>>
      env_func; // map of all visible functions in scope
  std::vector<std::shared_ptr<Node>>
      env_exit; // node to go to after terminator (not sure if
                // i should keep a copy or a ref)
  std::vector<llvm::Function *> call_list;
  std::vector<Var> env_return; // variable that contains the returned value if
                               // the terminator is a return
  std::map<std::string, std::shared_ptr<Node>> env_labels; // map of all labels
  std::map<std::string, std::shared_ptr<Node>>
      env_gotos; // list of gotos contains Node and the name of the label
};
