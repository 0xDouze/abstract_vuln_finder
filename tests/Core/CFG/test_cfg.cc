#include "CFG.hh"
#include "Func.hh"
#include "IR_manip.hh"
#include "Var.hh"
#include "gtest/gtest.h"
#include <list>
#include <llvm/IR/Function.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <set>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

TEST(CFG, DefaultConstructor) {
  CFG cfg;

  EXPECT_EQ(true, cfg.get_cfg_funcs().empty());
  EXPECT_EQ(true, cfg.get_cfg_nodes().empty());
  EXPECT_EQ(true, cfg.get_cfg_arcs().empty());
  EXPECT_EQ(nullptr, cfg.get_cfg_init_entry());
  EXPECT_EQ(nullptr, cfg.get_cfg_init_exit());
}

TEST(CFG, AddNode) {
  CFG cfg;

  EXPECT_EQ(true, cfg.get_cfg_nodes().empty());
  std::shared_ptr<Node> node = std::make_shared<Node>();
  node->id = 23;
  node->label = "Hello";
  cfg.add_cfg_node(node);
  EXPECT_EQ(false, cfg.get_cfg_nodes().empty());
}

TEST(CFG, AddArc) {
  CFG cfg;

  EXPECT_EQ(true, cfg.get_cfg_arcs().empty());
  std::shared_ptr<Arc> arc = std::make_shared<Arc>();
  arc->id = 53;
  cfg.add_cfg_arc(arc);
  EXPECT_EQ(false, cfg.get_cfg_arcs().empty());
}

TEST(CFG, AddVar) {
  CFG cfg;

  EXPECT_EQ(true, cfg.get_cfg_vars().empty());
  std::shared_ptr<Var> var = std::make_shared<Var>();
  var->id = 42;
  cfg.add_cfg_var(var);
  EXPECT_EQ(false, cfg.get_cfg_vars().empty());
}

TEST(CFG, AddFunc) {
  CFG cfg;

  EXPECT_EQ(true, cfg.get_cfg_funcs().empty());
  std::shared_ptr<Func> func = std::make_shared<Func>();
  func->name = "hello world";
  cfg.add_cfg_func(func);
  EXPECT_EQ(false, cfg.get_cfg_funcs().empty());
  std::string name = (*cfg.get_cfg_funcs().begin())->name;
  EXPECT_STREQ("hello world", name.c_str());
}
