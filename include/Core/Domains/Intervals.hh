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

// class IntervalDomain {
// public:
//  IntervalDomain() = default;
//  using Env = std::shared_ptr<
//      std::map<std::string, std::pair<std::uint32_t, std::uint32_t>>>;
//  Env top();
//  Env bottom();
//  Env constant(std::uint32_t c);
//  Env join(Env env1, Env env2);
//  Env meet(Env env1, Env env2);
//  bool is_subset(Env subset, Env set);
//  bool is_bottom(Env env);
//  static void print_env(Env env);
//  Env unary(Env env, llvm::UnaryInstruction *inst);
//  Env binary(Env left, Env right, llvm::BinaryOperator *inst);
//};

/// Class for the interval domain.
class IntervalDomain {
public:
  IntervalDomain() = default;
  ~IntervalDomain();

  using AbstractValue = std::vector<std::shared_ptr<struct Interval>>;
  /// Type of the environment. For ease of typing.
  using Env = std::map<std::string, AbstractValue>;

  /// Init the environment, with nothing inside. Returns a reference to the
  /// environment.
  Env &get_env();
  void set_bottom(AbstractValue &val);
  void set_top(AbstractValue &val);
  void set_top(std::shared_ptr<struct Interval> val);
  void set_bottom(std::shared_ptr<struct Interval> val);
  std::shared_ptr<struct Interval>
  join(const std::shared_ptr<struct Interval> &left,
       const std::shared_ptr<struct Interval> &right);
  std::shared_ptr<struct Interval>
  meet(const std::shared_ptr<struct Interval> &left,
       const std::shared_ptr<struct Interval> &right);
  AbstractValue &add_var(std::string &varname, unsigned dim);

  /// Assign_val assigns the interval found in src into dst.
  /// if src is empty, returns dst unmodified
  /// else returns a dst with the new interval
  AbstractValue &assign_val(AbstractValue &dst, AbstractValue &src);

  // might have a problem with mixing abstractvalue and intervals
  // not sure how it will turn out. might have to redo it later.
  void print_env() const;
  static bool is_bottom(const std::shared_ptr<struct Interval> &val);
  static bool is_top(const std::shared_ptr<struct Interval> &val);
  void operator()(const CFG &cfg);

  void bound_max(std::shared_ptr<struct Interval> out,
                 const std::shared_ptr<struct Interval> &left,
                 const std::shared_ptr<struct Interval> &right);

private:
  Env _abstract_values;
};
