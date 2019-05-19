#include "ConcreteDomain.hh"
#include <iostream>

ConcreteDomain::ConcreteDomain() {}

ConcreteDomain::Env ConcreteDomain::init() {
  ConcreteDomain::Env env =
      std::make_shared<std::set<std::pair<std::string, std::uint64_t>>>();
  _env.insert(env);
  return env;
}

ConcreteDomain::Env ConcreteDomain::bottom() { return nullptr; }

std::set<ConcreteDomain::Env> &ConcreteDomain::get_complete_env() {
  return _env;
}

ConcreteDomain::Env assign(ConcreteDomain::Env env, std::string var,
                           llvm::Instruction *expr) {
  (void)env;
  (void)var;
  (void)expr;
  return nullptr;
}

/// Given an environnement (meaning one variable), it will print all values of
/// the variable
void ConcreteDomain::print_env(Env env) const {
  if (env == nullptr)
    return;

  std::cout << "{\n";
  for (auto &S : *env)
    std::cout << "[ " << S.first << " = " << S.second << " ], ";

  std::cout << "\n}\n";
}

ConcreteDomain::Env ConcreteDomain::add_var(ConcreteDomain::Env env,
                                            std::string name) {
  env->insert(std::make_pair(name, 0));
  return env;
}
