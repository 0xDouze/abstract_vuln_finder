#include <string.h>
#include <llvm/Support/SourceMgr.h>
#include "TransformToCFG.hh"
TransformToCFG::TransformToCFG()
:_node_cnt(0)
{}

/* This code does not support calls yet, not hard to add
 * Also it stores IR instructions in the graph, which should
 * not be done and needs to be translated to simpler instructions
 * my god this project is long */
std::shared_ptr<Node> TransformToCFG::parse_instructions(IR_manip& ir, std::shared_ptr<Node> node, const std::list<llvm::Instruction*>::iterator begin, std::list<llvm::Instruction*>::iterator current, const std::list<llvm::Instruction*>::iterator end)
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
  current++;
  return parse_instructions(ir, node_next, begin, current, end);
}

std::shared_ptr<Node> TransformToCFG::convert_function_to_node(IR_manip& ir, const std::string& func)
{
  llvm::SMDiagnostic err;
  std::shared_ptr<Node> start = std::make_shared<Node>();
  std::list<llvm::Instruction*> inst;
  llvm::Function *handle = ir.get_function_handle(func);
  if (handle == nullptr)
  {
    err.print(__func__, llvm::errs());
    return nullptr;
  }
  ir.put_func_to_worklist(handle, inst);
  start->id = _node_cnt;
  start->pos = 0; //todo later
  _node_cnt++;
 parse_instructions(ir, start, inst.begin(), inst.begin(), inst.end());
 _node_cnt = 0;
 _arc_cnt = 0;
  return start;
}
