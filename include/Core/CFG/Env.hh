#pragma once
#include <llvm/ADT/StringMap.h>
#include <string>
#include "Graph.hh"
#include "Var.hh"
#include "Func.hh"

struct Gotos {
  Node out;
  std::string label;
};

//may need to change the Nodes, we'll see
struct Env {
  llvm::StringMap<Var> env_vars; //map of all variables in the function
  llvm::StringMap<Func> env_func; //map of all functions called
  Node env_exit; //node to go to after terminator (not sure if i should keep a copy or a ref)
  Var env_return; //variable that contains the returned value if the terminator is a return
  llvm::StringMap<Node> env_labels; //map of all labels
  std::vector<struct Gotos> env_gotos; //list of gotos contains Node and the name of the label
};
