#pragma once
#include <list>
#include <llvm/IR/Instruction.h>
#include <memory>

struct Arc;

/// Structure representing a node in the CFG
struct Node {
  Node();
  Node(const Node &other);
  Node &operator=(const Node &other);
  bool equal(const Node &other) const;
  int id;  // unique identifier
  int pos; // position in the source(todo) for now it's the name of the function

  /// String containing the label of a basic block if the following
  /// arc/edge is a new basic block
  std::string label;

  /// Contains a list of all the arcs that will be
  /// executed after going through this node.
  mutable std::list<std::shared_ptr<Arc>> arc_out;

  /// Contains all the arcs that go to this node.
  mutable std::list<std::shared_ptr<Arc>> arc_in;
};

/// Structure representing an arc/edge in the CFG
struct Arc {
  Arc();
  Arc(const Arc &other);
  Arc &operator=(const Arc &other);
  bool equal(const Arc &other) const;
  int id; // unique identifier

  /// Following node
  std::shared_ptr<Node> node_out; // node with this arc as source

  /// Previous node
  std::shared_ptr<Node> node_in; // node with this arc as output

  /// Pointer to the instruction executed by this arc/edge
  llvm::Instruction *inst;

  /// Pointer to the condition if the instruction is a terminator and
  /// has different execution flows depending on a condition.
  llvm::Value *cond; // condition (if present)
};
