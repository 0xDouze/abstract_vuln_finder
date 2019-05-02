#pragma once
#include <list>
#include <map>
#include <string>
#include "Graph.hh"
#include "Func.hh"
#include "Var.hh"
#include "IR_manip.hh"
#include <memory>

class TransformToCFG
{
public:
  TransformToCFG();
  std::shared_ptr<Node> convert_function_to_node(IR_manip& ir, const std::string& func);
  std::shared_ptr<Node> convert_function_to_node(llvm::Function *func);
private:
  std::shared_ptr<Node> parse_instructions(std::shared_ptr<Node> node, const std::list<llvm::Instruction*>::iterator begin, std::list<llvm::Instruction*>::iterator current, const std::list<llvm::Instruction*>::iterator end);
  unsigned _node_cnt;
  unsigned _arc_cnt;
};

struct env
{
  std::list<std::map<Node, std::string>> gotos;
};
