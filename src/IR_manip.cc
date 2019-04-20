#include "IR_manip.hh"

IR_manip::IR_manip(char * ir_file, llvm::LLVMContext& ctx, llvm::SMDiagnostic& diag)
{
	_ir_file = std::string(ir_file);
	_diag = diag;
	_mod = llvm::parseIRFile(_ir_file, diag, ctx);
}

IR_manip::~IR_manip()
{}

int IR_manip::check_module() const
{
	if (_mod == nullptr)
		return -1;
	return 0;
}
