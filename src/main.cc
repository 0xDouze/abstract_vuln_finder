#include "CFG.hh"
#include "ConcreteDomain.hh"
#include "IR_manip.hh"
#include "Intervals.hh"
#include "Iterator.hh"
#include "TransformToCFG.hh"
#include <ios>
#include <iostream>
#include <llvm/IR/BasicBlock.h>
#include <memory>
#include <set>

// All heil the allmighty os memory free
// This main is a crime against memory
// Tiny cells die each time this main is executed
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
  cfg.print_cfg_to_dot();

  auto vars = cfg.get_cfg_vars();
  for (auto &V : vars)
    llvm::errs() << *V->val << "\n";
  //  std::shared_ptr<Func> func;
  //  for (auto &F : cfg.get_cfg_funcs())
  //    if (F->name.find("main") != std::string::npos)
  //    {
  //      func = F;
  //      break;
  //    }
  //
  //  std::cout << func->name << "\n";
  //  for (auto &A : func->args)
  //  {
  //    if (auto retval = llvm::dyn_cast<llvm::Value>(A))
  //      std::cout << retval->getName().str() << "\n";
  //  }
  // ConcreteDomain domain;

  Iterator<IntervalDomain> ite(cfg);
  IntervalDomain tamere = ite.compute_dom_from_cfg();
 // tamere.print_env();
  return 0;
}
