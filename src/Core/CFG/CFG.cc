#include "CFG.hh"
#include <fstream>
CFG::CFG() {}

CFG::CFG(IR_manip &ir) {
  set_cfg_init_entry(ir);
  set_cfg_init_exit(ir);
}

CFG::CFG(IR_manip &ir, const llvm::Function *func) {
  (void)ir;
  (void)func;
}

const std::list<Var> &CFG::get_cfg_vars() const { return _cfg_vars; }

const std::list<Func> &CFG::get_cfg_funcs() const { return _cfg_funcs; }

const std::list<std::shared_ptr<Node>> CFG::get_cfg_nodes() const { return _cfg_nodes; }

const std::list<std::shared_ptr<Arc>> CFG::get_cfg_arcs() const { return _cfg_arcs; }

const std::shared_ptr<Node> CFG::get_cfg_init_entry() const {
  return _cfg_init_entry;
}

const std::shared_ptr<Node> CFG::get_cfg_init_exit() const {
  return _cfg_init_exit;
}

void CFG::add_cfg_var(const Var &var) { _cfg_vars.push_back(var); }

void CFG::add_cfg_func(const Func &func) { _cfg_funcs.push_back(func); }

void CFG::add_cfg_node(std::shared_ptr<Node> node) { _cfg_nodes.push_back(node); }

void CFG::add_cfg_arc(std::shared_ptr<Arc> arc) { _cfg_arcs.push_back(arc); }

void CFG::set_cfg_init_entry(std::shared_ptr<Node> init_entry) {
  _cfg_init_entry = init_entry;
}

void CFG::set_cfg_init_entry(IR_manip &ir) {
  TransformToCFG ttc;
  _cfg_init_entry = ttc.convert_function_to_node(ir, "__mcsema_constructor");
  if (_cfg_init_entry == nullptr)
    return; // Fix : Make node from default function constructor
  // llvm::errs() << *(*_cfg_init_entry->arc_out.begin())->inst;
}
void CFG::set_cfg_init_exit(std::shared_ptr<Node> init_exit) {
  _cfg_init_exit = init_exit;
}

void CFG::set_cfg_init_exit(IR_manip &ir) {
  TransformToCFG ttc;
  _cfg_init_exit = ttc.convert_function_to_node(ir, "__mcsema_destructor");
  if (_cfg_init_exit == nullptr)
    return; // Fix: Make node from default function destructor
}

void CFG::print_arc(std::fstream &file, std::shared_ptr<Arc> arc) {
  if (arc == nullptr)
    return;
  std::string inst;
  llvm::raw_string_ostream rso(inst);
  arc->inst->print(rso);
  file << arc->node_in->id << " -> " << arc->node_out->id << " [label=\""
       << inst << "\"];\n";
  print_node(file, arc->node_out);
}

void CFG::print_node(std::fstream &file, std::shared_ptr<Node> node) {
  if (node == nullptr)
    return;
  for (auto &I : node->arc_out)
    print_arc(file, I);
}

void CFG::print_init() {
  std::fstream file;
  llvm::Function *func =
      (*_cfg_init_entry->arc_out.begin())->inst->getFunction();
  std::string filename = func->getName().str();
  filename.append(".dot");
  file.open(filename,
            std::fstream::in | std::fstream::out | std::fstream::trunc);
  if (file.is_open() == false) {
    std::cerr << "Failed to open file for printing\n";
    return;
  }

  file << "digraph ";
  file << func->getName().str() << " {\n";
  print_node(file, _cfg_init_entry);
  file << "}";
  file.close();
}
