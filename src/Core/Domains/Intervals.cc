#include "Intervals.hh"
#include "Iterator.hh"
#include <algorithm>
#include <cstdint>

IntervalDomain::IntervalDomain(IntervalDomain &&o)
    : _abstract_values(o._abstract_values) {
  o._abstract_values.clear();
}

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

IntervalDomain::AbstractValue IntervalDomain::init_abs_val() {
  IntervalDomain::AbstractValue val;
  set_top(val);
  return val;
}

void IntervalDomain::update_env(std::string name, AbstractValue val) {
  _abstract_values[name] = val;
}

IntervalDomain::AbstractValue &
IntervalDomain::get_val_from_env(std::string &name) {
  return _abstract_values[name];
}

void IntervalDomain::set_bottom(AbstractValue &val) {
  if (is_bottom((*val.begin())))
    return;
  if (val.empty()) {
    std::cerr << "Error when trying to bottom an abstract value\n";
    return;
  } else {
    for (auto &V : val) {
      if (V->min != nullptr) {
        delete V->min;
        V->min = nullptr;
      }
      if (V->max != nullptr) {
        delete V->max;
        V->max = nullptr;
      }
    }
  }
}

void IntervalDomain::set_bottom(std::shared_ptr<struct Interval> val) {
  if (is_bottom(val))
    return;
  if (val == nullptr) {
    std::cerr << "Error while trying to set bottom from interval\n";
    return;
  } else {
    if (val->min != nullptr) {
      delete val->min;
      val->min = nullptr;
    }
    if (val->max != nullptr) {
      delete val->max;
      val->max = nullptr;
    }
  }
}

void IntervalDomain::set_top(std::shared_ptr<struct Interval> val) {
  if (val == nullptr) {
    std::cerr << "Error while trying to set top from interval\n";
    return;
  }
  if (val->min == nullptr)
    val->min = new struct Bound;
  if (val->max == nullptr)
    val->max = new struct Bound;
  val->min->inf = true;
  val->max->inf = true;
  val->dim = 1;
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
  for (unsigned i = 0; i < dim; ++i) {
    _abstract_values[varname].push_back(std::make_shared<struct Interval>());
  }
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

static inline std::int64_t max(std::int64_t a, std::int64_t b) {
  return a >= b ? a : b;
}

static inline std::int64_t min(std::int64_t a, std::int64_t b) {
  return a >= b ? b : a;
}

// join: [min(l,r), max(l,r)]
// FIX: rename to least upper bound
void IntervalDomain::bound_max(std::shared_ptr<struct Interval> out,
                               const std::shared_ptr<struct Interval> &left,
                               const std::shared_ptr<struct Interval> &right) {
  if (out == nullptr) {
    std::cerr << "Error while trying to bound max\n";
    return;
  }
  if (IntervalDomain::is_top(left) || IntervalDomain::is_top(right))
    set_top(out);
  if (IntervalDomain::is_bottom(left) && IntervalDomain::is_bottom(right))
    set_bottom(out);
  else if (IntervalDomain::is_bottom(left)) {
    out->min->val = right->min->val;
    out->min->inf = right->min->inf;
    out->max->val = right->min->val;
    out->max->inf = right->min->val;
    out->dim = right->dim;
  } else if (IntervalDomain::is_bottom(right)) {
    out->min->val = left->min->val;
    out->min->inf = left->min->inf;
    out->max->val = left->max->val;
    out->max->inf = left->max->inf;
    out->dim = left->dim;
  } else {
    out->min->val = min(left->min->val, right->min->val);
    out->min->inf = left->min->inf;
    out->max->val = max(left->max->val, right->max->val);
    out->max->inf = right->max->inf;
    out->dim = (left->dim >= right->dim ? left->dim : right->dim);
  }
}

// the dim won't mean anything, it's getting weird
// To check: for now BOT and a val is equal to val
// FIX: rename greatest lower bound
void IntervalDomain::bound_min(std::shared_ptr<struct Interval> out,
                               const std::shared_ptr<struct Interval> &left,
                               const std::shared_ptr<struct Interval> &right) {
  if (out == nullptr) {
    std::cerr << "Error while trying to bound min\n";
    return;
  }
  if (left == nullptr || right == nullptr || IntervalDomain::is_bottom(left) ||
      IntervalDomain::is_bottom(right))
    set_bottom(out);
  else if (IntervalDomain::is_top(left) && IntervalDomain::is_top(right))
    set_top(out);
  else if (IntervalDomain::is_top(left)) {
    out->min->val = right->min->val;
    out->min->inf = right->min->inf;
    out->max->val = right->min->val;
    out->max->inf = right->min->val;
    out->dim = right->dim;
  } else if (IntervalDomain::is_top(right)) {
    out->min->val = left->min->val;
    out->min->inf = left->min->inf;
    out->max->val = left->max->val;
    out->max->inf = left->max->inf;
    out->dim = left->dim;
  } else {
    if (max(left->min->val, right->min->val) <=
        min(left->max->val, right->max->val)) {
      out->min->val = max(left->min->val, right->min->val);
      out->min->inf = left->min->inf; // because it doesn't matter
      out->max->val = min(left->max->val, right->max->val);
      out->max->inf = right->max->inf; // because it doesn't matter
    } else
      set_bottom(out);
  }
}

// might need to change it so that inf is min of the bound
IntervalDomain::AbstractValue
IntervalDomain::join(IntervalDomain::AbstractValue &left,
                     IntervalDomain::AbstractValue &right) {
  IntervalDomain::AbstractValue out;

  if (left.empty())
    out = right;
  else if (right.empty())
    out = left;
  else {
    auto newsize = (left.size() >= right.size() ? right.size() : left.size());
    for (unsigned i = 0; i < newsize; ++i) {
      out.push_back(interval_join(left[i], right[i]));
    }
  }
  return out;
}

IntervalDomain::AbstractValue
IntervalDomain::meet(IntervalDomain::AbstractValue &left,
                     IntervalDomain::AbstractValue &right) {
  IntervalDomain::AbstractValue out;

  if ((*left.begin())->max == nullptr || (*right.begin())->max == nullptr)
    set_bottom(out);
  else {
    auto newsize = (left.size() >= right.size() ? right.size() : left.size());
    for (unsigned i = 0; i < newsize; ++i)
      out.push_back(interval_meet(left[i], right[i]));
  }
  return out;
}

IntervalDomain::AbstractValue IntervalDomain::widen(AbstractValue &left,
                                                    AbstractValue &right) {}

std::shared_ptr<struct Interval>
IntervalDomain::interval_join(const std::shared_ptr<struct Interval> &left,
                              const std::shared_ptr<struct Interval> &right) {
  std::shared_ptr<struct Interval> out;

  if (left == nullptr || IntervalDomain::is_bottom(left)) {
    if (right != nullptr && IntervalDomain::is_bottom(right) == false) {
      out = std::make_shared<struct Interval>();
      out->min = new struct Bound;
      out->max = new struct Bound;
      out->dim = right->dim;
      out->max->inf = right->max->inf;
      out->max->val = right->max->val;
      out->min->inf = right->min->inf;
      out->min->val = right->min->val;
    }
    return out;
  } else if (right == nullptr || IntervalDomain::is_bottom(right)) {
    out = std::make_shared<struct Interval>();
    out->min = new struct Bound;
    out->max = new struct Bound;
    out->dim = left->dim;
    out->max->inf = left->max->inf;
    out->max->val = left->max->val;
    out->min->inf = left->min->inf;
    out->min->val = left->min->val;
    return out;
  } else {
    out = std::make_shared<struct Interval>();
    out->max = new struct Bound;
    out->min = new struct Bound;
    bound_max(out, left, right);
    return out;
  }
}

std::shared_ptr<struct Interval>
IntervalDomain::interval_meet(const std::shared_ptr<struct Interval> &left,
                              const std::shared_ptr<struct Interval> &right) {
  std::shared_ptr<struct Interval> out = std::make_shared<struct Interval>();
  out->max = new struct Bound;
  out->min = new struct Bound;
  bound_min(out, left, right);
  return out;
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

void IntervalDomain::print_itv(const std::shared_ptr<struct Interval> &itv) {
  if (itv == nullptr)
    return;

  std::cout << "print itv\t";
  if (is_bottom(itv))
    std::cout << "BOT";
  else if (is_top(itv))
    std::cout << "[-inf, +inf]";
  else {
    if (itv->min->inf == true)
      std::cout << "[-inf, ";
    else
      std::cout << "[" << itv->min->val << ", ";

    if (itv->max->inf == true)
      std::cout << "+inf]\n";
    else
      std::cout << itv->max->val << "]\n";
  }
}

void IntervalDomain::print_abst_val(const IntervalDomain::AbstractValue &val) {
  for (auto &V : val) {
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
}
bool IntervalDomain::is_bottom(const std::shared_ptr<struct Interval> &val) {
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

bool IntervalDomain::is_equal(const AbstractValue &left,
                              const AbstractValue &right) {

  if (left.size() == right.size()) {
    for (std::uint32_t i = 0; i < left.size(); ++i) {
      if (is_bottom(left.at(i)) && is_bottom(right.at(i)))
        continue;
      else if (is_bottom(left.at(i)) && !is_bottom(right.at(i)))
        return false;
      else if (!is_bottom(left.at(i)) && is_bottom(right.at(i)))
        return false;
      else {
        if (*left.at(i) == *right.at(i))
          continue;
      }
    }
    return true;
  }
  return false;
}
// for now i am assuming that i will not have min or max to nullptr when
// the other one is not. Hopefully i'll never do that. Doing this lifting in c++
// is already long enough
IntervalDomain::AbstractValue
IntervalDomain::eval_stat(const std::shared_ptr<Arc> &arc) {
  if (arc == nullptr || arc->inst == nullptr)
    return std::vector<std::shared_ptr<struct Interval>>();

  IntervalDomain::AbstractValue absval;
  if (arc->retval == nullptr)
    absval = init_abs_val();
  else
    absval = _abstract_values[arc->retval->get_raw_name()];

  switch (arc->inst->getOpcode()) {

  case llvm::Instruction::Add:
    return _eval_add(arc, absval);
  case llvm::Instruction::Sub:
    return _eval_sub(arc, absval);
  default:
    break;
  }
  return absval;
}
