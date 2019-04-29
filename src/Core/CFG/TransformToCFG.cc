#include <string.h>
#include "TransformToCFG.hh"
TransformToCFG::TransformToCFG()
:_node_cnt(0)
{}

std::shared_ptr<Node> TransformToCFG::parse_instructions(std::shared_ptr<Node> node, std::set<llvm::Instruction*>::iterator begin, std::set<llvm::Instruction*>::iterator current, const std::set<llvm::Instruction*>::iterator end)
{
  if (current == end)
    return nullptr;

  std::shared_ptr<Arc> arc_cur = std::make_shared<Arc>();
  std::shared_ptr<Node> node_next = std::make_shared<Node>();
  node_next->id = _node_cnt;
  node_next->pos = 0; //todo later
  arc_cur->id = _arc_cnt;
  arc_cur->inst = *current;
  arc_cur->node_out = node_next;
  arc_cur->node_in = node;
  node->arc_out.push_back(arc_cur);
  node_next->arc_in.push_back(arc_cur);

  _node_cnt++;
  _arc_cnt++;
  return parse_instructions(node_next, begin, ++current, end);
}

std::shared_ptr<Node> TransformToCFG::convert_function_to_node(IR_manip& ir, const std::string& func)
{
  std::shared_ptr<Node> start = std::make_shared<Node>();
  std::set<llvm::Instruction*> inst;
  llvm::Function *handle = ir.get_function_handle(func);
  ir.put_func_to_worklist(handle, inst);
  start->id = _node_cnt;
  start->pos = 0; //todo later
  _node_cnt++;
 parse_instructions(start, inst.begin(), inst.begin(), inst.end());
 _node_cnt = 0;
 _arc_cnt = 0;
  return start;
}
