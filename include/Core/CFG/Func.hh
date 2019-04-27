#pragma once
#include <string>
#include <list>
#include <any>
#include "Graph.hh"

struct Func
{
  Func();
  int id; // Unique identifier to function
  std::string name; //Name of the function
  int pos; //Position in the source
  Node func_entry; //Entry node
  Node func_exit; //Exit node
  std::list<std::any> args; //Arguments
  std::any ret_val; //Return value
  std::list<Arc> func_calls; //list of calls to the function

  std::list<std::any> get_args() const;
  std::list<Arc> get_func_calls() const;
  void add_arg(const std::any& arg);
  void add_func_call(const Arc& call);
};


