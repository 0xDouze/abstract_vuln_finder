#include "TransformToCFG.hh"

TransformToCFG::TransformToCFG(IR_manip &ir, struct Env &env)
    : _node_cnt(0), _arc_cnt(0), _var_cnt(0), _func_cnt(0), _env(env) {}
