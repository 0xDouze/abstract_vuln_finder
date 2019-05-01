#include "Graph.hh"
#include "IR_manip.hh"
#include "gtest/gtest.h"
#include <memory>
#include <llvm/IR/Instruction.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Function.h>

TEST(Arc, DefaultConstructor){
  Arc arc;
  llvm::LLVMContext ctx;
  llvm::SMDiagnostic diag;
  char file[] = "../../tests/ll/arc4.ll";
  IR_manip ir(file, ctx, diag);
  std::set<std::string> inst_list = ir.get_function_list();
  std::cout << *inst_list.begin();
  llvm::Function *func = ir.get_function_handle(*inst_list.begin());
  arc.id = 1;
  for (llvm::inst_iterator I = llvm::inst_begin(func), E = inst_end(func); I != E; ++I)
  {
    arc.inst = &*I;
    break;
  }
  llvm::errs() << "premier: " << *(arc.inst) << "\n";
  Arc arc2;
  arc2.id = 1;
  for (llvm::inst_iterator I = llvm::inst_begin(func), E = inst_end(func); I != E; ++I)
    arc2.inst = &*I;
  llvm::errs() << "deuxieme: " << *(arc2.inst) << "\n";
  std::cout << arc.inst->getName().str() << "\n";
  std::cout << arc2.inst->getName().str() << "\n";
  EXPECT_FALSE(arc.equal(arc2));
  EXPECT_EQ(arc.id, arc2.id);
}

TEST(Node, DefaultConstructor){
  Node node;

  node.id = 1;
  node.pos = 2;
  node.arc_out.push_back(std::make_shared<Arc>());

  Node node2;
  node2.id = 2;
  node2.pos = 4;
  node2.arc_out.push_back(*node.arc_out.begin());

  EXPECT_EQ(1, node.id);
  EXPECT_EQ(2, node.pos);
  EXPECT_FALSE(*(node.arc_out.begin()) == nullptr);
  EXPECT_FALSE(node.equal(node2));
  EXPECT_EQ(*(node.arc_out.begin()), *(node2.arc_out.begin()));
}
