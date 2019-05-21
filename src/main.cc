#include "CFG.hh"
#include "ConcreteDomain.hh"
#include "IR_manip.hh"
#include "Iterator.hh"
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
  // cfg.print_cfg_to_dot();
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
  ConcreteDomain domain;

  Iterator<ConcreteDomain, ConcreteDomain::Env> iterator(cfg);
  domain = iterator(domain);
  std::vector<ConcreteDomain::Env> all = domain.get_complete_env();
  int i = 0;
  for (auto &S : all) {
    std::cout << i++ << "\n";
    domain.print_env(S);
  }
  return 0;
}
