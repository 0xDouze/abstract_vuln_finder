#include "Intervals.hh"
#include <cstdint>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>

IntervalDomain::AbstractValue IntervalDomain::_eval_add(const std::shared_ptr<Arc> &arc,
                                        IntervalDomain::AbstractValue &absval) {
  auto lop = arc->inst->getOperand(0);
  auto rop = arc->inst->getOperand(1);

  if (auto lop_val = llvm::dyn_cast<llvm::ConstantInt>(lop)) {
    if (auto rop_val = llvm::dyn_cast<llvm::ConstantInt>(rop)) {
      absval[0]->min->inf = false;
      absval[0]->max->inf = false;
      absval[0]->min->val = (lop_val->getValue().getSExtValue()) +
                            (rop_val->getValue().getSExtValue());
      absval[0]->max->val = (lop_val->getValue().getSExtValue()) +
                            (rop_val->getValue().getSExtValue());
    } else {
      auto rvar = _abstract_values.find(rop->getName());
      if (rvar == _abstract_values.end()) {
        std::cerr << "Error in the IR, second operand in add not found\n";
        return absval;
      }

      if (is_bottom((*rvar->second.begin())))
        set_bottom(absval);
      else if (is_top((*rvar->second.begin())))
        set_top(absval);
      else {
        absval[0]->min->inf = false;
        absval[0]->max->inf = false;
        absval[0]->min->val = (lop_val->getValue().getSExtValue()) +
                              (*rvar->second.begin())->min->val;
        absval[0]->max->val = (lop_val->getValue().getSExtValue()) +
                              (*rvar->second.begin())->max->val;
      }
    }
  } else if (auto rop_val = llvm::dyn_cast<llvm::ConstantInt>(rop)) {
    auto lvar = _abstract_values.find(lop->getName());
    if (lvar == _abstract_values.end()) {
      std::cerr << "Error in the IR, first operand not valid\n";
      return absval;
    }

    if (is_bottom((*lvar->second.begin())))
      set_bottom(absval);
    else if (is_top((*lvar->second.begin())))
      set_top(absval);
    else {
      absval[0]->min->inf = false;
      absval[0]->max->inf = false;
      absval[0]->min->val = (*lvar->second.begin())->min->val +
                            (rop_val->getValue().getSExtValue());
      absval[0]->max->val = (*lvar->second.begin())->max->val +
                            (rop_val->getValue().getSExtValue());
    }

  } else {
    auto rvar = _abstract_values.find(rop->getName());
    auto lvar = _abstract_values.find(lop->getName());

    if (rvar == _abstract_values.end() || lvar == _abstract_values.end()) {
      std::cerr << "So, here we either have an illformed ir, or you have a "
                   "write to an unknown address :)\n";
      return absval;
    }

    if (is_top(*rvar->second.begin()) || is_top(*lvar->second.begin()))
      for (auto &A : absval)
        set_top(A);

    else if (is_bottom(*rvar->second.begin()) ||
             is_bottom(*lvar->second.begin()))
      for (auto &A : absval)
        set_bottom(A);

    else {
      std::cout << rop->getName().str() << " : " << lop->getName().str()
                << "\n";
      absval[0]->min->inf = false;
      absval[0]->min->val =
          (*rvar->second.begin())->min->val + (*lvar->second.begin())->min->val;
      absval[0]->max->inf = false;
      absval[0]->max->val =
          (*rvar->second.begin())->max->val + (*lvar->second.begin())->max->val;
    }

    auto it = _abstract_values.find(arc->retval->get_raw_name());
    if (it != _abstract_values.end())
      for (unsigned i = 0; i < absval.size(); ++i)
        it->second[i] = absval[i];

    return absval;
  }
  return absval;
}

IntervalDomain::AbstractValue IntervalDomain::_eval_sub(const std::shared_ptr<Arc> &arc,
                                        IntervalDomain::AbstractValue &absval) {
  auto lop = arc->inst->getOperand(0);
  auto rop = arc->inst->getOperand(1);

  if (auto lop_val = llvm::dyn_cast<llvm::ConstantInt>(lop)) {
    if (auto rop_val = llvm::dyn_cast<llvm::ConstantInt>(rop)) {
      absval[0]->min->inf = false;
      absval[0]->max->inf = false;
      absval[0]->min->val = (lop_val->getValue().getSExtValue()) -
                            (rop_val->getValue().getSExtValue());
      absval[0]->max->val = (lop_val->getValue().getSExtValue()) -
                            (rop_val->getValue().getSExtValue());
    } else {
      auto rvar = _abstract_values.find(rop->getName());
      if (rvar == _abstract_values.end()) {
        std::cerr << "Error in the IR, second operand in add not found\n";
        return absval;
      }

      if (is_bottom((*rvar->second.begin())))
        set_bottom(absval);
      else if (is_top((*rvar->second.begin())))
        set_top(absval);
      else {
        absval[0]->min->inf = false;
        absval[0]->max->inf = false;
        absval[0]->min->val = (lop_val->getValue().getSExtValue()) -
                              (*rvar->second.begin())->min->val;
        absval[0]->max->val = (lop_val->getValue().getSExtValue()) -
                              (*rvar->second.begin())->max->val;
      }
    }
  } else if (auto rop_val = llvm::dyn_cast<llvm::ConstantInt>(rop)) {
    auto lvar = _abstract_values.find(lop->getName());
    if (lvar == _abstract_values.end()) {
      std::cerr << "Error in the IR, first operand not valid\n";
      return absval;
    }

    if (is_bottom((*lvar->second.begin())))
      set_bottom(absval);
    else if (is_top((*lvar->second.begin())))
      set_top(absval);
    else {
      absval[0]->min->inf = false;
      absval[0]->max->inf = false;
      absval[0]->min->val = (*lvar->second.begin())->min->val -
                            (rop_val->getValue().getSExtValue());
      absval[0]->max->val = (*lvar->second.begin())->max->val -
                            (rop_val->getValue().getSExtValue());
    }

  } else {
    auto rvar = _abstract_values.find(rop->getName());
    auto lvar = _abstract_values.find(lop->getName());

    if (rvar == _abstract_values.end() || lvar == _abstract_values.end()) {
      std::cerr << "So, here we either have an illformed ir, or you have a "
                   "write to an unknown address :)\n";
      return absval;
    }

    if (is_top(*rvar->second.begin()) || is_top(*lvar->second.begin()))
      for (auto &A : absval)
        set_top(A);

    else if (is_bottom(*rvar->second.begin()) ||
             is_bottom(*lvar->second.begin()))
      for (auto &A : absval)
        set_bottom(A);

    else {
      std::cout << rop->getName().str() << " : " << lop->getName().str()
                << "\n";
      absval[0]->min->inf = false;
      absval[0]->min->val = (*lvar->second.begin())->min->val - (*rvar->second.begin())->min->val;
      absval[0]->max->inf = false;
      absval[0]->max->val = (*lvar->second.begin())->max->val - (*rvar->second.begin())->max->val;
    }

    auto it = _abstract_values.find(arc->retval->get_raw_name());
    if (it != _abstract_values.end())
      for (unsigned i = 0; i < absval.size(); ++i)
        it->second[i] = absval[i];

    return absval;
  }
  return absval;
}
