#include "Graph.hh"

Node::Node()
  :id(0), pos(0)
{
  arc_out.empty();
  arc_in.empty();
}

Node::Node(const Node& other)
:id(other.id), pos(other.pos),
  arc_out(other.arc_out), arc_in(other.arc_in)
{}

Node& Node::operator=(const Node& other)
{
  if (this != &other)
  {
    id = other.id;
    pos = other.pos;
    arc_out = other.arc_out;
    arc_in = other.arc_in;
  }
  return *this;
}

bool Node::equal(const Node& other) const
{
  return id == other.id;
}

Arc::Arc()
  :id(0), inst(nullptr)
{
}

Arc::Arc(const Arc& other)
{
  id = other.id;
  node_out = other.node_out;
  node_in = other.node_in;
  inst = other.inst;
}

Arc& Arc::operator=(const Arc& other)
{
  if (this != &other)
  {
    id = other.id;
    node_out = other.node_out;
    node_in = other.node_in;
    inst = other.inst;
  }
  return *this;
}

bool Arc::equal(const Arc& other) const
{
  return other.id == id;
}
