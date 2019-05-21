#include "ConcreteDomain.hh"
#include <iostream>

ConcreteDomain::Env ConcreteDomain::init() {
  ConcreteDomain::Env env =
      std::make_shared<std::set<std::pair<std::string, std::uint64_t>>>();
  _env.push_back(env);
  //  std::sort(_env.begin(), _env.end(), compare_function);
  // auto last = std::unique(_env.begin(), _env.end());
  //_env.erase(last, _env.end());
  return env;
}

ConcreteDomain::Env ConcreteDomain::bottom() { return nullptr; }

std::vector<ConcreteDomain::Env> &ConcreteDomain::get_complete_env() {
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

  for (auto &S : *env)
    std::cout << "[ " << S.first << " = " << S.second << " ], ";
  std::cout << "\n";
}

ConcreteDomain::Env ConcreteDomain::add_var(ConcreteDomain::Env env,
                                            std::string name) {
  env->insert(std::make_pair(name, top));
  return env;
}

bool ConcreteDomain::compare_function(ConcreteDomain::Env env1,
                                      ConcreteDomain::Env env2) {
  return (*env1->begin()).first == ((*env2->begin()).first);
}
