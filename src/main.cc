#include "CFG.hh"
#include "IR_manip.hh"
#include "TransformToCFG.hh"
#include <ios>
#include <iostream>
#include <llvm/IR/BasicBlock.h>
#include <memory>
#include <set>

int main(int ac, char **av) {
  if (ac != 2) {
    llvm::errs() << "Usage: " << av[0] << " <IR file>\n";
    return -1;
  }

  llvm::SMDiagnostic Err;
  llvm::LLVMContext Context;
  IR_manip IR(av[1], Context, Err);
  if (IR.check_module() == -1) {
    Err.print(av[0], llvm::errs());
    return -1;
  }

  CFG cfg;
  TransformToCFG tcc(IR);
  cfg = tcc.transform_ir_to_cfg();
  // std::vector<std::shared_ptr<Node>> vect = cfg.get_cfg_nodes();
  //  for (auto &V : vect) {
  //   std::cout << V->id << "\n";
  //  for (auto &I : V->arc_out) {
  //   llvm::errs() << (*I->inst) << "\n";
  //}
  //  std::shared_ptr<Node> init = *vect.begin();
  //  llvm::errs() << init->id << " "
  //             << (*init->arc_out.begin())->inst->getOpcodeName() << " "
  //           << (*init->arc_out.begin())->node_out->id << "\n";
  //}
  // cfg.print_func_to_dot((*cfg.get_cfg_nodes().begin()));
  cfg.print_cfg_to_dot();
  return 0;
}
