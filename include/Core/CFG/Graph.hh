#pragma once
#include <list>
#include <llvm/IR/Instruction.h>

struct Arc;
struct Node
{
  Node();
  Node(const Node& other);
  Node& operator=(const Node& other);
  bool equal(const Node& other) const;
  int id; //unique identifier
  int pos; //position in the source(todo)
  mutable std::list<Arc> arc_out; // arcs with this node as source
  mutable std::list<Arc> arc_in; //arcs with this node as destination
};

struct Arc
{
  Arc();
  Arc(const Arc& other);
  Arc& operator=(const Arc& other);
  bool equal(const Arc& other) const;
  int id; //unique identifier
  Node node_out; // node with this arc as source
  Node node_in; // node with this arc as output
  llvm::Instruction *inst; //the instruction
};
