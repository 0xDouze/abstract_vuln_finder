#pragma once

#include <cstdint>
#include <iostream>
#include <llvm/IR/Instruction.h>
#include <map>
#include <memory>
#include <set>
#include <unordered_set>
#include <vector>

struct pair_hash {
  template <class T1, class T2>
  std::size_t operator()(const std::pair<T1, T2> &p) const {
    auto h1 = std::hash<T1>{}(p.first);
    auto h2 = std::hash<T2>{}(p.second);

    return h1 ^ h2;
  }
};

// We'll just do integers analysis for the concrete Domain, it's just to get the
// hang of it
// Maybe remove the shared_ptr we can just return an empty set. We'll do it for
// the interval domain
class ConcreteDomain {
public:
  ConcreteDomain() { std::cout << _env.size(); };
  using Env = std::shared_ptr<std::set<std::pair<std::string, std::uint64_t>>>;

  Env init();
  Env bottom();
  Env assign(Env env, std::string var, llvm::Instruction *expr);
  Env join(Env env1, Env env2);
  Env meet(Env env1, Env env2);
  std::vector<Env> &get_complete_env();
  void print_env(Env env) const;
  Env add_var(Env env, std::string name);

private:
  static bool compare_function(Env env1, Env env2);
  std::vector<Env> _env;
  std::vector<std::uint64_t> _val_set;
  std::uint64_t top = UINT64_MAX; // bounded lattice
};
