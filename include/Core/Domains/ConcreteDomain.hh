#pragma once

#include <cstdint>
#include <llvm/IR/Instruction.h>
#include <map>
#include <memory>
#include <set>
#include <vector>

// We'll just do integers analysis for the concrete Domain, it's just to get the
// hang of it
// Maybe remove the shared_ptr we can just return an empty set. We'll do it for
// the interval domain
class ConcreteDomain {
public:
  using Env = std::shared_ptr<std::set<std::pair<std::string, std::uint64_t>>>;
  ConcreteDomain();
  Env init();
  Env bottom();
  Env assign(Env env, std::string var, llvm::Instruction *expr);
  Env join(Env env1, Env env2);
  Env meet(Env env1, Env env2);
  std::set<Env> &get_complete_env();
  void print_env(Env env) const;
  Env add_var(Env env, std::string name);
private:
  std::set<Env> _env; // instruction as key
  std::set<std::uint64_t> _val_set;
};
