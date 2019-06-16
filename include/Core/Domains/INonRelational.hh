#pragma once
#include "Graph.hh"

template <typename AbstractValue, typename Env> class INonRelational {

public:
  virtual ~INonRelational(){};
  virtual AbstractValue init_abs_val() = 0;
  virtual void set_bottom(AbstractValue &val) = 0;
  virtual void set_top(AbstractValue &val) = 0;
  virtual AbstractValue &add_var(std::string &varname, unsigned dim) = 0;
  virtual void update_env(std::string name, AbstractValue val) = 0;
  virtual Env &get_env() = 0;
  virtual AbstractValue &get_val_from_env(std::string &name) = 0;
  virtual AbstractValue join(AbstractValue &left, AbstractValue &right) = 0;
  virtual AbstractValue meet(AbstractValue &left, AbstractValue &right) = 0;
  virtual AbstractValue &assign_val(AbstractValue &dst, AbstractValue &src) = 0;
  virtual AbstractValue eval_stat(const std::shared_ptr<Arc> &arc) = 0;
  virtual void print_env() const = 0;
};
