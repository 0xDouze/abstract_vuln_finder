#pragma once
//#include "Graph.hh"
#include <llvm/ADT/Twine.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>
#include <memory>
#include <string>

/// This structure represents a variable in the CFG.
/// Definitely fun and doesn't take space at all with
/// SSA :) :) :)
struct Var {

  /// The constructor can take a boolean specifying if the variable
  /// is a return value or not. By default it is not.
  Var(bool retval = false)
      : id(0), val(nullptr), type(nullptr), FuncName(), isRetVal(retval) {}

  /// Gives the name of the variable. Prepends a string to the name
  /// of the variable if it is a return variable.
  const std::string get_var_name() {
    if (isRetVal)
      return llvm::Twine("__ret")
          .concat(llvm::Twine(id))
          .concat(llvm::Twine("_"))
          .concat(llvm::Twine(val->getName()))
          .str();
    return val->getName();
  }

  const std::string get_raw_name() const { return val->getName(); }
  const std::string get_function_name() const { return FuncName; }

  int id; // unique variable identifier

  /// Pointer to an llvm::Value which contains all the informations
  /// needed about the variable.
  llvm::Value *val;

  /// Pointer to an llvm::Type. It contains the type of the variable
  llvm::Type *type;

  /// String containing the Function parent name
  llvm::StringRef FuncName;

  /// true if is a retval
  bool isRetVal;
};
