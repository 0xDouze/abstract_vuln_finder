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

const std::set<std::string> IR_manip::get_function_list() const {
  std::set<std::string> func_list;
  for (auto &I : _mod->getFunctionList()) {
    func_list.insert(I.getName());
  }
  return func_list;
}

/* The loop is done twice due to the naming of the functions on mcsema */
llvm::Function *IR_manip::get_function_handle(const std::string &func_name) {
  for (auto &I : (*_mod).getFunctionList()) {
    if (I.getName().str().find(func_name) != std::string::npos &&
        I.getName().str().find("sub") != std::string::npos)
      return _mod->getFunction(I.getName().str());
  }
  for (auto &I : _mod->getFunctionList()) {
    if (I.getName().str().find(func_name) != std::string::npos)
      return _mod->getFunction(I.getName().str());
  }
  llvm::errs() << func_name << ": Function not found\n";
  return nullptr;
}

void IR_manip::print_function(llvm::Function *func) const {
  if (func == nullptr)
    return;
  for (llvm::inst_iterator I = llvm::inst_begin(func), E = llvm::inst_end(func);
       I != E; ++I)
    llvm::errs() << *I << "\n";
}

void IR_manip::add_globals_to_worklist(
    std::vector<llvm::GlobalVariable *> &worklist) {
  auto &list = _mod->getGlobalList();
  for (auto &G : list)
    worklist.push_back(&G);
}

void IR_manip::add_BB_to_worklist(llvm::Function *func,
                                  std::vector<llvm::BasicBlock *> &worklist) {
  if (func == nullptr)
    return;
  for (llvm::BasicBlock &BB : *func)
    worklist.push_back(&BB);
}

void IR_manip::add_inst_to_worklist(
    llvm::Function *func, std::vector<llvm::Instruction *> &worklist) {
  if (func == nullptr)
    return;
  for (llvm::inst_iterator I = llvm::inst_begin(func), E = llvm::inst_end(func);
       I != E; ++I)
    worklist.push_back(&*I);
}
