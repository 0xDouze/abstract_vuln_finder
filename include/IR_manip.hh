#pragma once

#include <ios>
#include <iostream>
#include <list>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>
#include <set>
#include <string>

/// \brief This class is for manipulating the IR/BC file and input it to the CFG
/// creation pass.

class IR_manip {
public:
  IR_manip(char *ir_file, llvm::LLVMContext &ctx, llvm::SMDiagnostic &diag);
  ~IR_manip();
  int check_module() const;
  const std::set<std::string> get_function_list() const;
  /// Returns a pointer to an llvm::Function which is the class that gives
  /// you all the data about the wanted function which can be found in the
  /// LLVM file.
  llvm::Function *get_function_handle(const std::string &func_name);

  /// Just a printer of the function given in parameter to stdout.
  void print_function(llvm::Function *func) const;

  /// Inserts all global variables found in the module and inserts
  /// it into the vector given in parameter.
  void add_globals_to_worklist(std::vector<llvm::GlobalVariable *> &worklist);

  /// Inserts all basic blocks found in the function and inserts
  /// it into the vector given in parameter.
  static void add_BB_to_worklist(llvm::Function *func,
                                 std::vector<llvm::BasicBlock *> &worklist);

  /// Inserts all instructions found in the function without distinction
  /// of the basic blocks.
  static void add_inst_to_worklist(llvm::Function *func,
                                   std::vector<llvm::Instruction *> &worklist);

private:
  std::string _ir_file;
  llvm::SMDiagnostic _diag;
  std::unique_ptr<llvm::Module> _mod;
};
