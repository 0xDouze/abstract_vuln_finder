#include "TransformToCFG.hh"
#include <llvm/IR/Instructions.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/SourceMgr.h>
#include <string.h>

TransformToCFG::TransformToCFG() : _node_cnt(0) {}

/* It stores IR instructions in the graph, which should
 * not be done and needs to be translated to simpler instructions
 * Maybe will have to modify it because the branches are added continuously */
std::shared_ptr<Node> TransformToCFG::parse_instructions(
    std::shared_ptr<Node> node,
    const std::list<llvm::Instruction *>::iterator begin,
    std::list<llvm::Instruction *>::iterator current,
    const std::list<llvm::Instruction *>::iterator end) {
  if (current == end)
    return nullptr;

  if (strcmp((*(*current)).getOpcodeName(), "call") == 0) {
    llvm::CallInst *callinst = llvm::cast<llvm::CallInst>(*current);
    std::shared_ptr<Arc> arc_call = std::make_shared<Arc>();
    arc_call->id = _arc_cnt;
    arc_call->inst = callinst;
    arc_call->node_in = node;
    llvm::Function *func = callinst->getCalledFunction();
    if (func != nullptr) {
      arc_call->node_out = convert_function_to_node(func);
      node->arc_out.push_front(arc_call);
    }
    if (current != end)
      current++;
    else
      return nullptr;
  }

  std::shared_ptr<Arc> arc_cur = std::make_shared<Arc>();
  std::shared_ptr<Node> node_next = std::make_shared<Node>();
  node_next->id = _node_cnt;
  node_next->pos = 0; // todo later
  arc_cur->id = _arc_cnt;
  arc_cur->inst = *current;
  arc_cur->node_out = node_next;
  arc_cur->node_in = node;
  node->arc_out.push_back(arc_cur);
  node_next->arc_in.push_back(arc_cur);

  _node_cnt++;
  _arc_cnt++;
  current++;
  return parse_instructions(node_next, begin, current, end);
}

std::shared_ptr<Node>
TransformToCFG::convert_function_to_node(IR_manip &ir,
                                         const std::string &func) {
  llvm::SMDiagnostic err;
  std::shared_ptr<Node> start = std::make_shared<Node>();
  std::list<llvm::Instruction *> inst;
  llvm::Function *handle = ir.get_function_handle(func);
  if (handle == nullptr) {
    err.print(__func__, llvm::errs());
    return nullptr;
  }
  ir.put_func_to_worklist(handle, inst);
  start->id = _node_cnt;
  start->pos = 0; // todo later
  _node_cnt++;
  parse_instructions(start, inst.begin(), inst.begin(), inst.end());
  _node_cnt = 0;
  _arc_cnt = 0;
  return start;
}

std::shared_ptr<Node>
TransformToCFG::convert_function_to_node(llvm::Function *func) {
  llvm::SMDiagnostic err;
  std::shared_ptr<Node> start = std::make_shared<Node>();
  std::list<llvm::Instruction *> inst;
  IR_manip::put_func_to_worklist(func, inst);
  start->id = _node_cnt;
  start->pos = 0; // todo later
  _node_cnt++;
  parse_instructions(start, inst.begin(), inst.begin(), inst.end());
  return start;
}
