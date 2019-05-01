#include "CFG.hh"
#include "gtest/gtest.h"
#include "Var.hh"
#include <list>
#include "Func.hh"
#include "IR_manip.hh"
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Function.h>
#include <set>

TEST(CFG, DefaultConstructor){
  CFG cfg;

  EXPECT_EQ(std::list<Var>().empty(), cfg.get_cfg_vars().empty());
  EXPECT_EQ(std::list<Func>().empty(), cfg.get_cfg_funcs().empty());
  EXPECT_EQ(std::list<Node>().empty(), cfg.get_cfg_nodes().empty());
  EXPECT_EQ(std::list<Arc>().empty(), cfg.get_cfg_arcs().empty());
  EXPECT_EQ(nullptr, cfg.get_cfg_init_entry());
  EXPECT_EQ(nullptr, cfg.get_cfg_init_exit());
}

TEST(CFG, ConstructorWithIR){
  llvm::SMDiagnostic diag;
  llvm::LLVMContext ctx;
  char file[] = "../../tests/ll/buf_no_vuln.ll";

  IR_manip ir(file, ctx, diag);
  std::set<std::string> func_list = ir.get_function_list();
  CFG cfg(ir);

  EXPECT_EQ(1, (*(*(cfg.get_cfg_init_entry()->arc_out.begin()))).node_out->id);
}
