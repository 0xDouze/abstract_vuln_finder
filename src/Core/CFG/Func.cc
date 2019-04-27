#include "Func.hh"

Func::Func()
  :id(0), pos(0)
{
  ret_val.reset();
  args.empty();
  func_calls.empty();
}

std::list<std::any> Func::get_args() const
{
  return args;
}

std::list<Arc> Func::get_func_calls() const
{
  return func_calls;
}

void Func::add_arg(const std::any& arg)
{
  args.push_back(arg);
}

void Func::add_func_call(const Arc& call)
{
  func_calls.push_back(call);
}
