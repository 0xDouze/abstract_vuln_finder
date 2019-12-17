#include "Apron/APIntervals.hh"
#include "Iterator.hh"
#include <algorithm>
#include <cstdint>

APIntervalDomain::APIntervalDomain() {}

APIntervalDomain::~APIntervalDomain() {}

APIntervalDomain::APIntervalDomain(const APIntervalDomain &APDom) {
  _abstract_values = APDom._abstract_values;
}

APIntervalDomain::AbstractValue APIntervalDomain::init_abs_val() {
  auto abs = apron::interval(apron::top());
  std::cout << abs << "\n";
  return abs;
}

void APIntervalDomain::set_bottom(APIntervalDomain::AbstractValue &val) {}

void APIntervalDomain::set_top(APIntervalDomain::AbstractValue &val) {}

APIntervalDomain::AbstractValue &APIntervalDomain::add_var(std::string &varname,
                                                           unsigned dim) {}

void APIntervalDomain::update_env(std::string name, AbstractValue val) {}

APIntervalDomain::Env &APIntervalDomain::get_env() {}

APIntervalDomain::AbstractValue &
APIntervalDomain::get_val_from_env(std::string &name) {}

APIntervalDomain::AbstractValue
APIntervalDomain::join(APIntervalDomain::AbstractValue &left,
                       APIntervalDomain::AbstractValue &right) {}

APIntervalDomain::AbstractValue
APIntervalDomain::meet(APIntervalDomain::AbstractValue &left,
                       APIntervalDomain::AbstractValue &right) {}

APIntervalDomain::AbstractValue
APIntervalDomain::widen(APIntervalDomain::AbstractValue &left,
                        APIntervalDomain::AbstractValue &right) {}

APIntervalDomain::AbstractValue &
APIntervalDomain::assign_val(APIntervalDomain::AbstractValue &dst,
                             APIntervalDomain::AbstractValue &src) {}

APIntervalDomain::AbstractValue
APIntervalDomain::eval_stat(const std::shared_ptr<Arc> &arc) {}

void APIntervalDomain::print_env() const {}
