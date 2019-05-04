#pragma once
#include "Graph.hh"
#include <any>
#include <list>
#include <memory>
#include <string>

struct Func {
  Func();
  int id;                                     // Unique identifier to function
  std::string name;                           // Name of the function
  int pos;                                    // Position in the source
  std::shared_ptr<Node> func_entry;           // Entry node
  std::shared_ptr<Node> func_exit;            // Exit node
  std::list<std::any> args;                   // Arguments
  std::any ret_val;                           // Return value
  std::list<std::shared_ptr<Arc>> func_calls; // list of calls to the function

  std::list<std::any> get_args() const;
  std::list<std::shared_ptr<Arc>> get_func_calls() const;
  void add_arg(const std::any &arg);
  void add_func_call(std::shared_ptr<Arc> call);
};
