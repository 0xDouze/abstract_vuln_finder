#pragma once

#ifndef ENABLE_APRON
#error "Please enable apron in the cmake command line"
#endif

#include "CFG.hh"
#include "INonRelational.hh"

#include <algorithm>
#include <apronxx/apronxx.hh>
#include <apronxx/apxx_box.hh>
#include <apronxx/apxx_interval.hh>
#include <apronxx/apxx_manager.hh>
#include <map>
#include <memory>
#include <string>

/// APIntervalDomain: Class representing the interval domain using the Apron
/// library. Each class represents one abstracted function. One abstract value
/// represents one variable. Each abstract value share the same
/// "super-environment" in the apron library.
class APIntervalDomain
    : public INonRelational<std::shared_ptr<apron::abstract1>,
                            std::vector<std::shared_ptr<apron::abstract1>>> {
public:
  APIntervalDomain() = default;
  APIntervalDomain(const APIntervalDomain &APDom) = delete;
  APIntervalDomain &operator=(const APIntervalDomain &o) = delete;
  APIntervalDomain(APIntervalDomain &&o);
  ~APIntervalDomain() = default;

  using AbstractValue = std::shared_ptr<apron::abstract1>;
  using Env = std::vector<std::shared_ptr<apron::abstract1>>;

  AbstractValue init_abs_val();
  void set_bottom(AbstractValue &val);
  void set_top(AbstractValue &val);
  AbstractValue add_var(std::string &varname, unsigned dim);
  void update_env(std::string name, AbstractValue val);
  Env get_env();
  AbstractValue get_val_from_env(std::string &name);
  AbstractValue join(AbstractValue &left, AbstractValue &right);
  AbstractValue meet(AbstractValue &left, AbstractValue &right);
  AbstractValue widen(AbstractValue &left, AbstractValue &right);
  AbstractValue assign_val(AbstractValue &dst, AbstractValue &src);
  AbstractValue eval_stat(const std::shared_ptr<Arc> &arc);
  void print_env() const;
  void init_internal_env(const std::shared_ptr<Func> &func);

  static bool is_equal(const AbstractValue &left, const AbstractValue &right);

private:
  apron::box_manager _box;
  Env _abs_env;
  apron::environment _ap_env; // env real + int
};
