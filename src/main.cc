#include <iostream>
#include <ios>
#include "IR_manip.hh"
int main(int ac, char **av)
{
	if (ac != 2)
	{
		llvm::errs() << "Usage: " << av[0] << " <IR file>\n";
		return -1;
	}

	llvm::SMDiagnostic Err;
	llvm::LLVMContext Context;
	IR_manip IR(av[1], Context, Err);
	if (IR.check_module() == -1)
	{
		Err.print(av[0], llvm::errs());
		return -1;
	}

	return 0;
}
