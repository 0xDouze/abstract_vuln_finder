#include "ConcreteDomain.hh"

ConcreteDomain::ConcreteDomain() {}

std::map<std::string, std::uint64_t> ConcreteDomain::init() {
  _env = std::map<std::string, std::uint64_t>();
  return std::map<std::string, std::uint64_t>();
}

std::map<std::string, std::uint64_t> ConcreteDomain::bottom() {
  return std::map<std::string, std::uint64_t>();
}
