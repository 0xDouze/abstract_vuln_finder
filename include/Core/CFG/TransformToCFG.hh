#pragma once
#include "CFG.hh"
#include "Env.hh"
#include "Func.hh"
#include "Graph.hh"
#include "IR_manip.hh"
#include "Var.hh"
#include <list>
#include <llvm/ADT/StringMap.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>
#include <map>
#include <memory>
#include <string>
#include <utility>
#include <vector>

/* This class transforms the IR to be compatible with our own CFG.
 * set_cfg_entry : gives a pair of entry and end nodes for the init function
 * (constructor for now)
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
  TransformToCFG();
  CFG transform_ir_to_cfg(IR_manip &ir);

private:
  std::shared_ptr<Node> create_node(int pos);
  std::shared_ptr<Arc> create_arc(std::shared_ptr<Node> src,
                                  std::shared_ptr<Node> dst,
                                  llvm::Instruction *inst);
  std::shared_ptr<Var> create_var(llvm::Value *val, std::shared_ptr<Arc> pos,
                                  llvm::Type *type);

  std::shared_ptr<Func> create_func(const std::string &name,
                                    std::shared_ptr<Node> entry,
                                    std::shared_ptr<Node> exit, int pos,
                                    const std::vector<llvm::Argument *> &args,
                                    std::shared_ptr<Var> ret);

  std::vector<llvm::Instruction *>::iterator &
  add_inst(std::shared_ptr<Node> entry, std::shared_ptr<Node> exit,
           const std::vector<llvm::Instruction *>::iterator &begin,
           std::vector<llvm::Instruction *>::iterator &curr,
           const std::vector<llvm::Instruction *>::iterator &end);

  unsigned _node_cnt; // node counter
  unsigned _arc_cnt;  // arc counter
  unsigned _var_cnt;  // var counter
  unsigned _func_cnt; // func counter
  CFG _cfg;
};
