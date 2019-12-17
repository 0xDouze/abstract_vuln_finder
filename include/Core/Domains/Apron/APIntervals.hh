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

class APIntervalDomain
    : public INonRelational<apron::interval,
                            std::map<std::string, apron::interval>> {
public:
  APIntervalDomain();
  APIntervalDomain(const APIntervalDomain &APDom);
  ~APIntervalDomain();

  using AbstractValue = apron::interval;
  using Env = std::map<std::string, apron::interval>;

  AbstractValue init_abs_val();
  void set_bottom(AbstractValue &val);
  void set_top(AbstractValue &val);
  AbstractValue &add_var(std::string &varname, unsigned dim);
  void update_env(std::string name, AbstractValue val);
  Env &get_env();
  AbstractValue &get_val_from_env(std::string &name);
  AbstractValue join(AbstractValue &left, AbstractValue &right);
  AbstractValue meet(AbstractValue &left, AbstractValue &right);
  AbstractValue widen(AbstractValue &left, AbstractValue &right);
  AbstractValue &assign_val(AbstractValue &dst, AbstractValue &src);
  AbstractValue eval_stat(const std::shared_ptr<Arc> &arc);
  void print_env() const;

private:
  Env _abstract_values;
  apron::box_manager box;
};
