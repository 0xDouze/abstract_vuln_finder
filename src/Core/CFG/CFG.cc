#include "CFG.hh"
#include <fstream>
#include <llvm/ADT/Twine.h>

CFG::CFG() {}

CFG::CFG(IR_manip &ir) {
  (void)ir;
  //  struct Env env;
  // TransformToCFG ttc;
  // std::pair<std::shared_ptr<Node>, std::shared_ptr<Node>> inits =
  //    ttc.set_cfg_entry(env, ir);
}

CFG::CFG(IR_manip &ir, const std::string &func_name) {
  (void)ir;
  (void)func_name;
  //  TransformToCFG ttc();
  // struct Env env;

  // set_cfg_init_entry(ir);
  // set_cfg_init_exit(ir);

  // if (ttc.convert_function_to_node(ir, env, func_name) == nullptr)
  // return;
  // print_func_to_dot(_cfg_init_entry);
  // if (env.env_vars.empty() == false)
  //  _cfg_vars.insert(env.env_vars.begin(), env.env_vars.end());

  // if (env.env_func.empty() == false) {
  //  _cfg_funcs.insert(env.env_func.begin(), env.env_func.end());
  //  set_arcs_and_nodes(env);
  //}
}
// Fix: Change the CFG type to an unordered set
void CFG::add_arc(struct Env &env, std::shared_ptr<Arc> arc) {
  if (arc == nullptr)
    return;
  _cfg_arcs.push_back(arc);
  add_node(env, arc->node_out);
}

void CFG::add_node(struct Env &env, std::shared_ptr<Node> node) {
  if (node == nullptr)
    return;
  _cfg_nodes.push_back(node);
  for (auto &I : node->arc_out)
    add_arc(env, I);
}

void CFG::set_arcs_and_nodes(struct Env &env) {
  if (env.env_func.empty() == false)
    for (auto &I : env.env_func)
      add_node(env, I->func_entry);
}
const std::vector<std::shared_ptr<Var>> &CFG::get_cfg_vars() const {
  return _cfg_vars;
}

const std::vector<std::shared_ptr<Func>> &CFG::get_cfg_funcs() const {
  return _cfg_funcs;
}

const std::vector<std::shared_ptr<Node>> &CFG::get_cfg_nodes() const {
  return _cfg_nodes;
}

const std::vector<std::shared_ptr<Arc>> &CFG::get_cfg_arcs() const {
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
    _cfg_vars.push_back(var);
}

void CFG::add_cfg_func(std::shared_ptr<Func> func) {
  if (func != nullptr)
    _cfg_funcs.push_back(func);
}

void CFG::add_cfg_node(std::shared_ptr<Node> node) {
  if (node != nullptr)
    _cfg_nodes.push_back(node);
}

void CFG::add_cfg_arc(std::shared_ptr<Arc> arc) {
  if (arc != nullptr)
    _cfg_arcs.push_back(arc);
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

  while (((passed.size() != func->bb_cnt) || (stack.empty() == false)) ||
         entry_node != func->func_exit) {
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

    entry_node = stack.back();
    stack.pop_back();
    while (passed.find(entry_node) != passed.end()) {
      entry_node = stack.back();
      stack.pop_back();
    }
  }
}

void CFG::print_cfg_to_dot() {
  std::fstream file;
  if (_cfg_funcs.empty()) {
    std::cout << "hmmm c'est vide putain\n";
    return;
  }
  for (auto &F : _cfg_funcs) {
    std::cout << &F << "addresse de Func \n";
    if (F == nullptr)
      std::cout << "wtf cest null\n";
    if (F->func_entry == nullptr || F->func_entry->arc_out.empty())
      continue;
    file.open(llvm::Twine(F->name).concat(llvm::Twine(".dot")).str(),
              std::fstream::in | std::fstream::out | std::fstream::trunc);
    if (file.is_open() == false) {
      std::cerr << "Failed to open file " << F->name << ".dot"
                << "for printing\n";
      return;
    }
    file << "digraph ";
    file << F->name << " {\nforcelabels=true;\n";
    print_function(file, F);
    file << "}";
    file.close();
    std::cout << "coucou je devrais bien creer le fichier c'est louche\n";
  }
}

void CFG::print_func_to_dot(const std::shared_ptr<Node> &func_entry) {
  std::fstream file;
  (void)func_entry;
}
