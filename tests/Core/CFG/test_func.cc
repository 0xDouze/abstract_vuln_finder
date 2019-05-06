#include "Func.hh"
#include "gtest/gtest.h"
#include <any>
#include <list>
#include <llvm/IR/Function.h>
#include <utility>

TEST(Func, DefaultConstructor) {
  Func func;
  EXPECT_EQ(std::vector<llvm::Argument *>().empty(), func.get_args().empty());
  EXPECT_EQ(std::vector<std::shared_ptr<Arc>>().empty(),
            func.get_func_calls().empty());

  Arc arc;
  arc.id = 1;
  func.add_func_call(std::make_shared<Arc>(arc));
  std::list<Arc> tamere;
  tamere.push_back(arc);
  EXPECT_EQ(tamere.begin()->id, (*func.get_func_calls().begin())->id);
}
