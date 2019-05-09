#pragma once
#include "Env.hh"
#include "Func.hh"
#include "Graph.hh"
#include "IR_manip.hh"
#include "Var.hh"
#include <list>
#include <llvm/ADT/StringMap.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Value.h>
#include <map>
#include <memory>
#include <string>
#include <utility>
#include <vector>

/* This class transforms the IR to be compatible with our own CFG.
 * Needs to be called for each functions.
 */
class TransformToCFG {
public:
  //  TransformToCFG();
  //  std::shared_ptr<Node> convert_function_to_node(IR_manip &ir, struct Env
  //  &env,
  //                                                 const std::string &func);
  //  std::shared_ptr<Node> convert_call_to_node(struct Env &env,
  //                                                 const llvm::Function
  //                                                 *func);
  //  bool check_calls_in_func(struct Env& env, std::vector<llvm::Instruction*>&
  //  worklist);
  // private:
  //  std::shared_ptr<Node>
  //  parse_instructions(struct Env &env, std::shared_ptr<Node> node,
  //                     const llvm::BasicBlock::iterator begin,
  //                     llvm::BasicBlock::iterator current,
  //                     const llvm::BasicBlock::iterator end);
  TransformToCFG(IR_manip &ir, struct Env &env);

private:
  unsigned _node_cnt; // node counter
  unsigned _arc_cnt;  // arc counter
  unsigned _var_cnt;  // var counter
  unsigned _func_cnt; // func counter
  struct Env _env;
};
