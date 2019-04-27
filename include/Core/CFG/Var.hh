#pragma once
#include <string>
struct Var
{
  Var();
  int id; //unique variable identifier
  std::string name; //name of the variable (if found)
  std::string type; // type
  int pos; //position in the program
};

Var::Var()
  :id(0), pos(0)
{}
