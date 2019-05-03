#include "CFG.hh"
#include "IR_manip.hh"
#include <ios>
#include <iostream>
#include <memory>
#include <set>

void test_graph(std::set<llvm::Instruction *> &worklist) {
  std::shared_ptr<Arc> arc = std::make_shared<Arc>();
  std::shared_ptr<Node> node = std::make_shared<Node>();

  arc->id = 1;
  arc->inst = *worklist.begin();
  node->arc_in.push_back(arc);
  node->pos = 2;
  llvm::errs() << *(*node->arc_in.begin())->inst;

  CFG cfg;
}

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

  CFG cfg(IR);
  cfg.print_init();
  // test_graph(worklist);

  return 0;
}
