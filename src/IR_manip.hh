#pragma once

#include <iostream>
#include <ios>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/raw_ostream.h>

class IR_manip
{
public:
	IR_manip(char* ir_file, llvm::LLVMContext& ctx, llvm::SMDiagnostic& diag);
	~IR_manip();
	int check_module() const;
private:
	std::string _ir_file;
	std::unique_ptr<llvm::Module> _mod;
	llvm::SMDiagnostic _diag;
};
