#include "IR_manip.hh"

IR_manip::IR_manip(char *ir_file, llvm::LLVMContext &ctx,
                   llvm::SMDiagnostic &diag) {
  _ir_file = std::string(ir_file);
  _diag = diag;
  _mod = llvm::parseIRFile(_ir_file, diag, ctx);
}

IR_manip::~IR_manip() {}

int IR_manip::check_module() const {
  if (_mod == nullptr)
    return -1;
  return 0;
}

llvm::Function *IR_manip::get_function_handle(const std::string &func_name) {
  for (auto &I : (*_mod).getFunctionList()) {
    // std::cout << I.getName().str() << "\n";
    if (I.getName().str().find(func_name) != std::string::npos &&
        I.getName().str().find("sub") != std::string::npos)
      return _mod->getFunction(I.getName().str());
  }
  return nullptr;
}

void IR_manip::print_function(llvm::Function *func) const {
  for (llvm::inst_iterator I = llvm::inst_begin(func), E = llvm::inst_end(func);
       I != E; ++I)
    llvm::errs() << *I << "\n";
}
