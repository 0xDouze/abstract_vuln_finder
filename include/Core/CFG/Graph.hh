#pragma once
#include <list>
#include <llvm/IR/Instruction.h>
#include <memory>

struct Arc;
struct Node {
  Node();
  Node(const Node &other);
  Node &operator=(const Node &other);
  bool equal(const Node &other) const;
  int id;  // unique identifier
  int pos; // position in the source(todo) for now it's the name of the function
  std::string label;
  mutable std::list<std::shared_ptr<Arc>>
      arc_out; // arcs with this node as source
  mutable std::list<std::shared_ptr<Arc>>
      arc_in; // arcs with this node as destination
};

struct Arc {
  Arc();
  Arc(const Arc &other);
  Arc &operator=(const Arc &other);
  bool equal(const Arc &other) const;
  int id;                         // unique identifier
  std::shared_ptr<Node> node_out; // node with this arc as source
  std::shared_ptr<Node> node_in;  // node with this arc as output
  llvm::Instruction *inst;        // the instruction
  llvm::Value *cond;              // condition (if present)
};
