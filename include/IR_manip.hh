#pragma once

#include <ios>
#include <iostream>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>
#include <set>

/*! This class is used to manipulate the ir for further use */
class IR_manip {
public:
  IR_manip(char *ir_file, llvm::LLVMContext &ctx, llvm::SMDiagnostic &diag);
  ~IR_manip();
  int check_module() const;
  llvm::Function *get_function_handle(const std::string &func_name);
  void print_function(llvm::Function *func) const;
  void put_func_to_worklist(llvm::Function *func,
                            std::set<llvm::Instruction *> &worklist);

private:
  std::string _ir_file;
  llvm::SMDiagnostic _diag;
  std::unique_ptr<llvm::Module> _mod;
};
