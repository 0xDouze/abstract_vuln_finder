#pragma once
#include "CFG.hh"
#include "INonRelational.hh"
#include <iostream>
#include <map>
#include <memory>

struct Bound {
  Bound() = default;
  std::int64_t val;
  bool inf; // is set to true if inf
};

struct Interval {
  Interval() = default;
  Interval(const Interval &o) = delete;
  Interval &operator=(const Interval &o) = delete;
  Interval(Interval &&o) : min(o.min), max(o.max), dim(o.dim) {
    o.min = nullptr;
    o.max = nullptr;
  }
  bool operator==(const Interval &o) const {
    if (min != nullptr && max != nullptr && o.min != nullptr &&
        o.max != nullptr)
      return min->inf == o.min->inf && max->inf == o.max->inf &&
             min->val == o.min->val && max->val == o.max->val;
    else {
      if ((min == nullptr && o.min == nullptr) &&
          (max == nullptr && o.max == nullptr))
        return true;
      else if ((min == nullptr && o.min == nullptr) &&
               (max != nullptr && o.max != nullptr))
        return true;
      else if ((min != nullptr && o.min != nullptr) &&
               (max == nullptr && o.max == nullptr))
        return true;
      else
        return false;
    }
  }

  Bound *min;
  Bound *max;
  int dim;
};

/// Class for the interval domain.
// +inf * 0 = 0; 0/0 = 0; f.a. x, x/ +-inf = 0; f.a. x > 0,
// x/0 = +inf, f.a. x < 0, x/0 = -inf

class IntervalDomain
    : public INonRelational<
          std::vector<std::shared_ptr<struct Interval>>,
          std::map<std::string,
                   std::vector<std::shared_ptr<struct Interval>>>> {
public:
  IntervalDomain() = default;
  IntervalDomain(const CFG &cfg);
  IntervalDomain(const IntervalDomain &o) = delete;
  IntervalDomain &operator=(const IntervalDomain &o) = delete;
  IntervalDomain(IntervalDomain &&o);
  ~IntervalDomain();

  using AbstractValue = std::vector<std::shared_ptr<struct Interval>>;
  /// Type of the environment. For ease of typing.
  using Env = std::map<std::string, AbstractValue>;
  Env &get_env();

  /// Init the environment, with nothing inside. Returns a reference to the
  /// environment.
  AbstractValue init_abs_val();
  void set_bottom(AbstractValue &val);
  void set_top(AbstractValue &val);
  void set_top(std::shared_ptr<struct Interval> val);
  void set_bottom(std::shared_ptr<struct Interval> val);
  AbstractValue &add_var(std::string &varname, unsigned dim);

  void update_env(std::string name, AbstractValue val);
  AbstractValue &get_val_from_env(std::string &name);
  AbstractValue join(AbstractValue &left, AbstractValue &right);
  AbstractValue meet(AbstractValue &left, AbstractValue &right);
  AbstractValue widen(AbstractValue &left, AbstractValue &right);

  /// Assign_val assigns the interval found in src into dst.
  /// if src is empty, returns dst unmodified
  /// else returns a dst with the new interval
  AbstractValue &assign_val(AbstractValue &dst, AbstractValue &src);

  // might have a problem with mixing abstractvalue and intervals
  // not sure how it will turn out. might have to redo it later.
  void print_env() const;
  static void print_itv(const std::shared_ptr<struct Interval> &itv);
  static void print_abst_val(const AbstractValue &val);
  static bool is_bottom(const std::shared_ptr<struct Interval> &val);
  static bool is_top(const std::shared_ptr<struct Interval> &val);
  static bool is_equal(const AbstractValue &left, const AbstractValue &right);
  AbstractValue eval_stat(const std::shared_ptr<Arc> &arc);

private:
  std::shared_ptr<struct Interval>
  interval_join(const std::shared_ptr<struct Interval> &left,
                const std::shared_ptr<struct Interval> &right);
  std::shared_ptr<struct Interval>
  interval_meet(const std::shared_ptr<struct Interval> &left,
                const std::shared_ptr<struct Interval> &right);
  void bound_max(std::shared_ptr<struct Interval> out,
                 const std::shared_ptr<struct Interval> &left,
                 const std::shared_ptr<struct Interval> &right);

  void bound_min(std::shared_ptr<struct Interval> out,
                 const std::shared_ptr<struct Interval> &left,
                 const std::shared_ptr<struct Interval> &right);

private:
  AbstractValue _eval_add(const std::shared_ptr<Arc> &arc,
                          AbstractValue &absval);
  AbstractValue _eval_sub(const std::shared_ptr<Arc> &arc,
                          AbstractValue &absval);
  Env _abstract_values;
};
