#include "Intervals.hh"
#include <cstdint>
#include <algorithm>

// Might look like I'm supporting arrays, but I don't think it's a good
// way of handling it. If one value of the array is a bottom, everything
// will be set to bottom

IntervalDomain::~IntervalDomain() {
  for (auto &M : _abstract_values) {
    for (auto &V : M.second) {
      if (V->min != nullptr)
        delete V->min;
      if (V->max != nullptr)
        delete V->max;
    }
  }
}

IntervalDomain::Env &IntervalDomain::get_env() { return _abstract_values; }

void IntervalDomain::set_bottom(AbstractValue &val) {
  if (val.empty()) {
    std::cerr << "Error when trying to bottom an abstract value\n";
    return;
  } else {
    for (auto &V : val) {
      if (V->min != nullptr)
        delete V->min;
      if (V->max != nullptr)
        delete V->max;
    }
  }
}

void IntervalDomain::set_bottom(std::shared_ptr<struct Interval> val)
{
  if (val == nullptr)
  {
    std::cerr << "Error while trying to set bottom from interval\n";
    return;
  }
  if (val->min != nullptr)
    delete val->min;
  if (val->max != nullptr)
    delete val->max;
}

void IntervalDomain::set_top(std::shared_ptr<struct Interval> val)
{
  if (val == nullptr)
  {
    std::cerr << "Error while trying to set top from interval\n";
    return;
  }
  val->min->inf = true;
  val->max->inf = true;
}

void IntervalDomain::set_top(AbstractValue &val) {
  // I have to use new here to implement bottom
  // I will represent it by freeing the bounds
  // val.empty checked in case the dimension is 0
  if (val.empty()) {
    auto iv = std::make_shared<struct Interval>();
    iv->min = new struct Bound;
    iv->max = new struct Bound;
    iv->dim = 1;
    iv->min->inf = true;
    iv->min->val = INT64_MAX;
    iv->max->inf = true;
    iv->max->val = INT64_MAX;
    val.push_back(iv);
  }
  for (auto &V : val) {
    if (V->min == nullptr)
      V->min = new struct Bound;
    if (V->max == nullptr)
      V->max = new struct Bound;
    V->dim = val.size();
    V->min->inf = true;
    V->max->inf = true;
  }
}

IntervalDomain::AbstractValue &IntervalDomain::add_var(std::string &varname,
                                                       unsigned dim) {
  _abstract_values[varname] = std::vector<std::shared_ptr<struct Interval>>();
  for (unsigned i = 0; i < dim; ++i)
    _abstract_values[varname].push_back(std::make_shared<struct Interval>());
  set_top(_abstract_values[varname]);
  return _abstract_values[varname];
}

IntervalDomain::AbstractValue &IntervalDomain::assign_val(AbstractValue &dst,
                                                          AbstractValue &src) {
  if (src.empty()) {
    std::cerr << "Error while trying to assign an interval to a value\n";
    return dst;
  }

  for (auto db = dst.begin(), de = dst.end(), sb = src.begin(), se = src.end();
       (db != de) && (sb != se); ++db, ++sb) {
    if ((*db)->min == nullptr && (*sb)->min != nullptr)
      (*db)->min = new struct Bound;
    if ((*db)->max == nullptr && (*sb)->max != nullptr)
      (*db)->max = new struct Bound;

    if ((*sb)->min == nullptr && (*db)->min != nullptr)
      delete (*db)->min;
    if ((*sb)->max == nullptr && (*db)->max != nullptr)
      delete (*db)->max;

    (*db)->dim = (*sb)->dim;
    (*db)->min->inf = (*sb)->min->inf;
    (*db)->min->val = (*sb)->min->val;
    (*db)->max->inf = (*sb)->max->inf;
    (*db)->max->val = (*sb)->max->val;
  }
  return dst;
}

void IntervalDomain::bound_max(std::shared_ptr<struct Interval> out, const std::shared_ptr<struct Interval> &left, const std::shared_ptr<struct Interval> &right)
{
  if (out == nullptr)
    out = std::make_shared<struct Interval>();
  if (IntervalDomain::is_top(left) || IntervalDomain::is_top(right))
    set_top(out);
  else{
    out->min->val = (left->min->val >= right->min->val ? left->min->val : right->min->val);
    out->max->val = (left->max->val >= right->max->val ? left->max->val : right->max->val);
    out->dim = (left->dim >= right->dim ? left->dim : right->dim);
  }
}

std::shared_ptr<struct Interval> IntervalDomain::join(const std::shared_ptr<struct Interval> &left, const std::shared_ptr<struct Interval> &right)
{
  std::shared_ptr<struct Interval> out;

  if (IntervalDomain::is_bottom(left))
  {
    if (IntervalDomain::is_bottom(right) == false)
      out = right;
    return out;
  }
  else if (IntervalDomain::is_bottom(right))
  {
    out = left;
    return out;
  }
  else {
    bound_max(out, left, right);
    return out;
  }
}

std::shared_ptr<struct Interval> IntervalDomain::meet(const std::shared_ptr<struct Interval> &left, const std::shared_ptr<struct Interval> &right)
{
  (void)left;
  (void)right;
  return nullptr;
}

void IntervalDomain::print_env() const {
  for (auto &M : _abstract_values) {
    std::cout << "{ " << M.first << ": ";
    for (auto &V : M.second) {
      std::cout << " [ ";
      if (is_top(V))
        std::cout << "-inf, +inf ]\n";
      else if (is_bottom(V))
        std::cout << "BOT ]\n";
      else {
        if (V->min->inf == true)
          std::cout << "-inf, ";
        else
          std::cout << V->min->val << ", ";

        if (V->max->inf == true)
          std::cout << "+inf ]\n";
        else
          std::cout << V->max->val << " ]\n";
      }
    }
    std::cout << "}\n";
  }
}

bool IntervalDomain::is_bottom(const std::shared_ptr<struct Interval> &val){
  if (val == nullptr)
    return true;
  return (val->max == nullptr) || (val->min == nullptr);
}

bool IntervalDomain::is_top(const std::shared_ptr<struct Interval> &val) {
  if (val == nullptr)
    return false;
  if (IntervalDomain::is_bottom(val))
    return false;

  return val->max->inf == true && val->min->inf == true;
}
