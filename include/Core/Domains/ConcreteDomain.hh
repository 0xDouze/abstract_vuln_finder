#pragma once

#include "Domain.hh"
#include <cstdint>

class ConcreteDomain : public Domain<std::map<std::string, std::uint64_t>> {
public:
  ConcreteDomain();
  std::map<std::string, uint64_t> init();
  std::map<std::string, uint64_t> bottom();

private:
  std::map<std::string, std::uint64_t> _env;
  std::set<std::uint64_t> _val_set;
};
