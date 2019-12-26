#include "Func.hh"

Func::Func() : id(0), pos(0), bb_cnt(0) {}

const std::vector<llvm::Argument *> &Func::get_args() const { return args; }

const std::vector<std::shared_ptr<Arc>> &Func::get_func_calls() const {
  return func_calls;
}

const std::vector<std::shared_ptr<Var>> &Func::get_all_vars() const {
  return vars;
}

void Func::add_arg(llvm::Argument *arg) { args.push_back(arg); }

void Func::add_func_call(std::shared_ptr<Arc> call) {
  func_calls.push_back(call);
}

void Func::add_var(std::shared_ptr<Var> var) { vars.push_back(var); }
