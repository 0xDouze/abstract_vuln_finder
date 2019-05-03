#include "Graph.hh"

Node::Node() : id(0), pos(0) {}

Node::Node(const Node &other) {
  this->id = other.id;
  this->pos = other.pos;
  this->arc_in = other.arc_in;
  this->arc_out = other.arc_out;
}

Node &Node::operator=(const Node &other) {
  if (this != &other) {
    id = other.id;
    pos = other.pos;
    arc_out = other.arc_out;
    arc_in = other.arc_in;
  }
  return *this;
}

bool Node::equal(const Node &other) const {
  return (id == other.id) && (pos == other.pos) && (arc_in == other.arc_in) &&
         (arc_out == other.arc_out);
}

Arc::Arc() : id(0), node_out(nullptr), node_in(nullptr), inst(nullptr) {}

Arc::Arc(const Arc &other) {
  this->id = other.id;
  this->inst = other.inst;
  this->node_in = other.node_in;
  this->node_out = other.node_out;
}
Arc &Arc::operator=(const Arc &other) {
  if (this != &other) {
    id = other.id;
    node_out = other.node_out;
    node_in = other.node_in;
    inst = other.inst;
  }
  return *this;
}

bool Arc::equal(const Arc &other) const {
  return (other.id == id) && (node_out == other.node_out) &&
         (node_in == other.node_in) && (inst == other.inst);
}
