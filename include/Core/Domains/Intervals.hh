#pragma once
#include "CFG.hh"
#include <iostream>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <map>
#include <memory>

struct Bound {
  Bound() = default;
  std::int64_t val;
  bool inf; // is set to true if inf
};

struct Interval {
  Interval() = default;
  Bound *min;
  Bound *max;
  int dim;
};

/// Class for the interval domain.
class IntervalDomain {
public:
  IntervalDomain() = default;
  IntervalDomain(const CFG &cfg);
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

protected:
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
  Env _abstract_values;
};
