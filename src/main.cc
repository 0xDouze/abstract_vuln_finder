#include "IR_manip.hh"
#include <ios>
#include <iostream>
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

  llvm::Function *func = IR.get_function_handle("sub_401126_main");
  if (func == nullptr) {
    Err.print(av[0], llvm::errs());
    return -1;
  }

  //  IR.print_function(func);

  std::set<llvm::Instruction *> worklist;
  IR.put_func_to_worklist(func, worklist);
  for (auto const &I : worklist) {
    llvm::errs() << *I << "\n";
  }

  return 0;
}
