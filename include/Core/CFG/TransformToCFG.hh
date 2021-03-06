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
  /// Constructor. Takes an IR_manip reference. Not much to say here.
  TransformToCFG(IR_manip &ir);

  /// This function does everything. Takes as a parameter the name of
  /// the entry point of the binary. Will then convert to cfg all the functions
  /// called by the function (and the entry function itself of course).
  /// Will return an std::move of the CFG declared as a member of the class.
  CFG transform_ir_to_cfg(const std::string &start_function = "main");

private:
  std::shared_ptr<Node> create_node(int pos);
  std::shared_ptr<Arc> create_arc(std::shared_ptr<Node> src,
                                  std::shared_ptr<Node> dst,
                                  llvm::Instruction *inst);

  std::shared_ptr<Var> create_var(llvm::Value *val, llvm::Type *type,
                                  bool isRetVal = false);

  std::shared_ptr<Func> create_func(const std::string &name,
                                    std::shared_ptr<Node> entry,
                                    std::shared_ptr<Node> exit, int pos,
                                    const std::vector<llvm::Argument *> &args,
                                    std::vector<std::shared_ptr<Var>> ret);

  // FIXME: Remove the curr iterator, it's useless
  std::vector<llvm::Instruction *>::iterator &
  add_inst(std::shared_ptr<Node> entry, std::shared_ptr<Node> exit,
           const std::vector<llvm::Instruction *>::iterator &begin,
           std::vector<llvm::Instruction *>::iterator &curr,
           const std::vector<llvm::Instruction *>::iterator &end);

  // FIXME: Why did I put vector iterators? The question remains unanswered to
  // this day
  std::shared_ptr<Node>
  append_inst(std::shared_ptr<Node> entry,
              std::vector<llvm::Instruction *>::iterator &begin,
              const std::vector<llvm::Instruction *>::iterator &end);

  std::shared_ptr<Node>
  prepend_inst(std::shared_ptr<Node> exit,
               std::vector<llvm::Instruction *>::iterator &begin,
               const std::vector<llvm::Instruction *>::iterator &end);

  void set_constructor();

  void get_data_pass(std::shared_ptr<Func> func_desc,
                     std::vector<llvm::BasicBlock *> &blocks);

  void create_graph_pass(std::shared_ptr<struct Env> env,
                         std::shared_ptr<Func> func_desc,
                         std::vector<llvm::BasicBlock *> blocks);

  void set_edges(std::shared_ptr<struct Env> env,
                 std::shared_ptr<Func> func_desc,
                 std::vector<llvm::BasicBlock *> blocks);

  void translate_func_to_cfg(llvm::Function *func, std::shared_ptr<Node> entry,
                             std::shared_ptr<Node> exit);

  void set_func_env_var(std::shared_ptr<struct Env>,
                        std::shared_ptr<Func> func_desc,
                        llvm::Instruction &inst);

  unsigned long long _node_cnt; // node counter
  unsigned long long _arc_cnt;  // arc counter
  unsigned long long _var_cnt;  // var counter
  unsigned long long _func_cnt; // func counter
  IR_manip &_ir;                // ir_manip ref
  CFG _cfg; // whole cfg, is std::moved at the end of the computation
  std::vector<std::pair<std::shared_ptr<struct Env>, std::shared_ptr<Func>>>
      _func_envs; // vector of function environment
};
