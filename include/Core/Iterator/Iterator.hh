#pragma once

#include "CFG.hh"
#include "ConcreteDomain.hh"
#include "Func.hh"

template <typename T, typename V> class Iterator {
public:
  Iterator(const CFG &cfg);
  T &operator()(T &dom);

private:
  const CFG &_cfg;
  std::vector<std::shared_ptr<Node>> _dirty_nodes;
};

template <typename T, typename V>
Iterator<T, V>::Iterator(const CFG &cfg) : _cfg(cfg) {}

template <typename T, typename V> T &Iterator<T, V>::operator()(T &dom) {
  V env;
  env = dom.init();

  std::shared_ptr<Func> func;

  for (auto &A : _cfg.get_cfg_funcs())
    if (A->name.find("main") != std::string::npos) {
      func = A;
      break;
    }
  std::cout << (func ? func->name : "empty") << "\n";

  return dom;
}
