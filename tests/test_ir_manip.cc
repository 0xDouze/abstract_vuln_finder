#include "IR_manip.hh"
#include "gtest/gtest.h"
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/LLVMContext.h>
#include <set>
#include <string>

TEST(IR_manip, ConstructorFromCorrectFile){
  llvm::LLVMContext ctx;
  llvm::SMDiagnostic diag;
  char tamere[] = "../../tests/ll/arc4.ll";
  IR_manip ir(tamere, ctx, diag);
  EXPECT_EQ(0, ir.check_module());
  EXPECT_EQ(!std::set<std::string>().empty(), ir.get_function_list().empty());
  EXPECT_EQ(3, (ir.get_function_handle("main"))->arg_size());
  ir.print_function(ir.get_function_handle("main"));
}

