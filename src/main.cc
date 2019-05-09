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

  llvm::Function *func = IR.get_function_handle("main");
  if (func == nullptr) {
    std::cout << "func not found" << std::endl;
    Err.print(av[0], llvm::errs());
    return -1;
  }
  CFG cfg;
  TransformToCFG tcc;
  cfg = tcc.transform_ir_to_cfg(IR);
  return 0;
}
