#pragma once

#include "CFG.hh"
#include "Domain.hh"

class Iterator {
public:
  Iterator(const CFG &cfg);

private:
  const CFG &_cfg;
};
