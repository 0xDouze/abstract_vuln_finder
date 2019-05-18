#include "CFG.hh"
#include <fstream>
#include <llvm/ADT/Twine.h>

CFG::CFG() {}

void CFG::add_arc(struct Env &env, std::shared_ptr<Arc> arc) {
  if (arc == nullptr)
    return;
  _cfg_arcs.insert(arc);
  add_node(env, arc->node_out);
}

void CFG::add_node(struct Env &env, std::shared_ptr<Node> node) {
  if (node == nullptr)
    return;
  _cfg_nodes.insert(node);
  for (auto &I : node->arc_out)
    add_arc(env, I);
}

void CFG::set_arcs_and_nodes(struct Env &env) {
  if (env.env_func.empty() == false)
    for (auto &I : env.env_func)
      add_node(env, I->func_entry);
}
const std::unordered_set<std::shared_ptr<Var>> &CFG::get_cfg_vars() const {
  return _cfg_vars;
}

const std::unordered_set<std::shared_ptr<Func>> &CFG::get_cfg_funcs() const {
  return _cfg_funcs;
}

const std::unordered_set<std::shared_ptr<Node>> &CFG::get_cfg_nodes() const {
  return _cfg_nodes;
}

const std::unordered_set<std::shared_ptr<Arc>> &CFG::get_cfg_arcs() const {
  return _cfg_arcs;
}

const std::shared_ptr<Node> &CFG::get_cfg_init_entry() const {
  return _cfg_init_entry;
}

const std::shared_ptr<Node> &CFG::get_cfg_init_exit() const {
  return _cfg_init_exit;
}

void CFG::add_cfg_var(std::shared_ptr<Var> var) {
  if (var != nullptr)
    _cfg_vars.insert(var);
}

void CFG::add_cfg_func(std::shared_ptr<Func> func) {
  if (func != nullptr)
    _cfg_funcs.insert(func);
}

void CFG::add_cfg_node(std::shared_ptr<Node> node) {
  if (node != nullptr)
    _cfg_nodes.insert(node);
}

void CFG::add_cfg_arc(std::shared_ptr<Arc> arc) {
  if (arc != nullptr)
    _cfg_arcs.insert(arc);
}

void CFG::set_cfg_init_entry(std::shared_ptr<Node> init_entry) {
  _cfg_init_entry = init_entry;
}

void CFG::set_cfg_init_entry(IR_manip &ir) { (void)ir; }
void CFG::set_cfg_init_exit(std::shared_ptr<Node> init_exit) {
  _cfg_init_exit = init_exit;
}

void CFG::set_cfg_init_exit(IR_manip &ir) { (void)ir; }

void CFG::print_function(std::fstream &file,
                         const std::shared_ptr<Func> &func) {
  std::shared_ptr<Node> entry_node = func->func_entry;
  std::set<std::shared_ptr<Node>> passed;
  std::vector<std::shared_ptr<Node>> stack;

  while ((entry_node->arc_out.empty() == false) ||
         ((passed.size() < func->bb_cnt) || (stack.empty() == false))) { // ||
    if (entry_node->label != "") {
      file << entry_node->id << " [xlabel=\"" << entry_node->label << "\"]\n";
      passed.insert(entry_node);
    }

    for (auto &A : entry_node->arc_out) {
      stack.push_back(A->node_out);
      std::string inst;
      llvm::raw_string_ostream rso(inst);
      A->inst->print(rso);
      file << entry_node->id << " -> " << A->node_out->id << " [label=\""
           << inst << "\"];\n";
    }

    if (stack.size() == 0)
      return;

    do {
      entry_node = stack.back();
      stack.pop_back();
    } while ((passed.count(entry_node)) && stack.size() > 0);

    if (passed.count(entry_node) && stack.size() == 0)
      return;
  }
}

void CFG::print_cfg_to_dot() {
  std::fstream file;

  for (auto &F : _cfg_funcs) {
    if (F->func_entry == nullptr || F->func_entry->arc_out.empty())
      continue;
    file.open(llvm::Twine(F->name).concat(llvm::Twine(".dot")).str(),
              std::fstream::in | std::fstream::out | std::fstream::trunc);
    if (file.is_open() == false) {
      std::cerr << "Failed to open file " << F->name << ".dot"
                << "for printing\n";
      return;
    }
    file << "strict digraph ";
    file << F->name << " {\nforcelabels=true;\n";
    print_function(file, F);
    file << "}";
    file.close();
  }
}

// TODO
void CFG::print_func_to_dot(const std::shared_ptr<Node> &func_entry) {
  std::fstream file;
  (void)func_entry;
}
