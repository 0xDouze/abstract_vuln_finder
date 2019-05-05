#include "CFG.hh"
#include "IR_manip.hh"
#include <ios>
#include <iostream>
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

  //  CFG cfg(IR);
  // cfg.print_init();
  // test_graph(worklist);
  CFG cfg(IR, "sub_400526_main");
  return 0;
}
