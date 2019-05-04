#include "Func.hh"
#include "gtest/gtest.h"
#include <any>
#include <list>
#include <utility>

TEST(Func, DefaultConstructor) {
  Func func;
  EXPECT_EQ(std::list<std::any>().empty(), func.get_args().empty());
  EXPECT_EQ(std::list<std::shared_ptr<Arc>>().empty(),
            func.get_func_calls().empty());

  std::list<std::any> test;
  test.push_back("coucou");
  func.add_arg("coucou");
  // EXPECT_STREQ(std::any_cast<char*>(*(test.begin())),
  // std::any_cast<char*>(*(func.get_args().begin())));
  std::cout << *test.begin()->type().name() << std::endl;
  std::cout << *test.begin()->type().name() << std::endl;
  EXPECT_EQ(*test.begin()->type().name(),
            *(func.get_args().begin())->type().name());
  Arc arc;
  arc.id = 1;
  func.add_func_call(std::make_shared<Arc>(arc));
  std::list<Arc> tamere;
  tamere.push_back(arc);
  EXPECT_EQ(tamere.begin()->id, (*func.get_func_calls().begin())->id);
}
