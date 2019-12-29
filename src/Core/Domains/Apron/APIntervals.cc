#include "Apron/APIntervals.hh"
#include "Iterator.hh"
#include <algorithm>
#include <cstdint>

APIntervalDomain::APIntervalDomain(APIntervalDomain &&o)
    : _box(o._box), _ap_env(o._ap_env) {}

APIntervalDomain::AbstractValue APIntervalDomain::init_abs_val() {
  auto abs = std::make_shared<apron::abstract1>(_box, _ap_env, apron::top());
  return abs;
}

void APIntervalDomain::set_bottom(APIntervalDomain::AbstractValue &val) {
  val->set(_box, apron::bottom());
}

void APIntervalDomain::set_top(APIntervalDomain::AbstractValue &val) {
  val->set(_box, apron::top());
}

// fix the function -- might not be useful anymore here
APIntervalDomain::AbstractValue APIntervalDomain::add_var(std::string &varname,
                                                          unsigned dim) {
  (void)varname;
  (void)dim;
  return nullptr;
}

// I will have to add do everything in the eval stat for the computation of the
// abstract values. Might be useless too because if absval is top or bottom
// every variable is unconstrained... A pain to integrate this in my
// framework...
void APIntervalDomain::update_env(std::string name, AbstractValue val) {

  (void)name;
  for (auto &V : _abs_env) {
    if (*V == *val) {
      *V = *val;
      return;
    }
  }
  _abs_env.push_back(val);
}

APIntervalDomain::Env APIntervalDomain::get_env() { return _abs_env; }

APIntervalDomain::AbstractValue
APIntervalDomain::get_val_from_env(std::string &name) {

  auto var = apron::var(name);

  if (_ap_env.contains(var) == false) {
    std::cerr << "Error " << __func__ << "variable not found in the domain\n";
    return nullptr;
  }

  for (const auto &V : _abs_env) {
    if (V->is_variable_unconstrained(_box, var) ==
        false) { // variable is constrained in abstract value
      return V;
    }
  }

  return nullptr;
}

APIntervalDomain::AbstractValue
APIntervalDomain::join(APIntervalDomain::AbstractValue &left,
                       APIntervalDomain::AbstractValue &right) {
  if (left == nullptr)
    return right;
  else if (right == nullptr)
    return left;
  else {
    AbstractValue res = init_abs_val();
    apron::join(_box, *res, *left, *right);

    return res;
  }
}

APIntervalDomain::AbstractValue
APIntervalDomain::meet(APIntervalDomain::AbstractValue &left,
                       APIntervalDomain::AbstractValue &right) {

  AbstractValue res = init_abs_val();
  if (left == nullptr || right == nullptr)
    set_bottom(res);
  else
    apron::meet(_box, *res, *left, *right);

  return res;
}

APIntervalDomain::AbstractValue
APIntervalDomain::widen(APIntervalDomain::AbstractValue &left,
                        APIntervalDomain::AbstractValue &right) {
  (void)left;
  (void)right;
  return nullptr;
}

APIntervalDomain::AbstractValue
APIntervalDomain::assign_val(APIntervalDomain::AbstractValue &dst,
                             APIntervalDomain::AbstractValue &src) {
  (void)src;
  (void)dst;
  return nullptr;
}

APIntervalDomain::AbstractValue
APIntervalDomain::eval_stat(const std::shared_ptr<Arc> &arc) {

  (void)arc;
  return nullptr;
}

void APIntervalDomain::print_env() const {
  for (auto &V : _abs_env)
    std::cout << *V << "\n";
}

void APIntervalDomain::init_internal_env(const std::shared_ptr<Func> &func) {
  if (func == nullptr || func->func_entry == nullptr)
    return;
  std::vector<std::shared_ptr<Var>> vars = func->get_all_vars();
  std::vector<apron::var> inte_vars;
  std::vector<apron::var> real_vars;

  for (auto &V : vars) {
    inte_vars.push_back(apron::var(std::string("i") + V->get_raw_name()));
    real_vars.push_back(apron::var(V->get_raw_name()));
  }

  _ap_env = _ap_env.add(inte_vars, real_vars);
}

bool APIntervalDomain::is_equal(const APIntervalDomain::AbstractValue &left,
                                const APIntervalDomain::AbstractValue &right) {
  return *left == *right;
}
