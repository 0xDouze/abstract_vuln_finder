#include "Apron/APIntervals.hh"
#include "Iterator.hh"
#include <algorithm>
#include <cstdint>

APIntervalDomain::APIntervalDomain(APIntervalDomain &&o)
    : _box(o._box), _ap_env(o._ap_env) {}

APIntervalDomain::AbstractValue APIntervalDomain::init_abs_val() {
  auto abs = apron::interval(apron::top());
  std::cout << abs << "\n";
  return abs;
}

void APIntervalDomain::set_bottom(APIntervalDomain::AbstractValue &val) {
  val.set(apron::bottom());
}

void APIntervalDomain::set_top(APIntervalDomain::AbstractValue &val) {
  val.set(apron::top());
}
// fix the dim
APIntervalDomain::AbstractValue APIntervalDomain::add_var(std::string &varname,
                                                          unsigned dim) {
  (void)dim;
  auto var_tmp = apron::var(varname);
  for (auto &V : _abs_env) {
    auto env_tmp = V->get_environment();

    if (env_tmp.contains(var_tmp)) {
      std::cerr << "Variable " << varname << " already exists in the domain\n";
      return V->bound(_box, var_tmp);
    }
  }

  std::vector<apron::var> inte = {apron::var(std::string("i") + varname)};
  std::vector<apron::var> real = {apron::var(varname)};
  apron::environment e(inte, real);

  auto absval = std::make_shared<apron::abstract1>(_box, e, apron::top());
  _abs_env.push_back(absval);
}

void APIntervalDomain::update_env(std::string name, AbstractValue val) {
  (void)name;
  (void)val;
  //  std::vector<apron::var> inte = {std::string("i") + name};
  //  std::vector<apron::var> real = {name};
  //  std::vector<apron::interval> interv = {val};
  //  apron::environment e(inte, real);
  //  apron::interval_array inar(interv);

  //  for (auto &V : _abs_env) {
  //    if (V != nullptr) {
  //    }
  //  }
  // auto absval = std::make_shared<apron::abstract1>(_box, e, inte, interv);

  // std::cout << absval->to_box(_box) << " ca c'est mon interval\n";

  // absval = std::make_shared<apron::abstract1>(_box, e, apron::top());
  // std::cout << absval->to_box(_box) << "ca c'est mon bottom interval\n";
  // std::cout << absval->bound(_box, std::string("i") + name) << "\n";
}

APIntervalDomain::Env APIntervalDomain::get_env() { return _abs_env; }

APIntervalDomain::AbstractValue
APIntervalDomain::get_val_from_env(std::string &name) {
  auto var = apron::var(name);

  if (!_abs_env.empty()) {
    for (auto &V : _abs_env) {
      if (V != nullptr) {
        auto env = V->get_environment();
        if (env.contains(var))
          return V->bound(_box, var);
      }
    }
  } else
    std::cerr << "Error no abstract value found\n";

  return apron::interval(apron::bottom());
}

APIntervalDomain::AbstractValue
APIntervalDomain::join(APIntervalDomain::AbstractValue &left,
                       APIntervalDomain::AbstractValue &right) {
  (void)left;
  (void)right;
  return apron::bottom();
}

APIntervalDomain::AbstractValue
APIntervalDomain::meet(APIntervalDomain::AbstractValue &left,
                       APIntervalDomain::AbstractValue &right) {
  (void)left;
  (void)right;
  return apron::bottom();
}

APIntervalDomain::AbstractValue
APIntervalDomain::widen(APIntervalDomain::AbstractValue &left,
                        APIntervalDomain::AbstractValue &right) {
  (void)left;
  (void)right;
  return apron::bottom();
}

APIntervalDomain::AbstractValue
APIntervalDomain::assign_val(APIntervalDomain::AbstractValue &dst,
                             APIntervalDomain::AbstractValue &src) {
  (void)src;
  (void)dst;
}

APIntervalDomain::AbstractValue
APIntervalDomain::eval_stat(const std::shared_ptr<Arc> &arc) {

  (void)arc;
  return apron::bottom();
}

void APIntervalDomain::print_env() const {}

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

  _ap_env.add(inte_vars, real_vars);
  std::cout << "test called: " << _ap_env << "\n";
}

bool APIntervalDomain::is_equal(const APIntervalDomain::AbstractValue &left,
                                const APIntervalDomain::AbstractValue &right) {
  return left == right;
}
