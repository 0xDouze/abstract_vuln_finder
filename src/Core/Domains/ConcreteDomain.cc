#include "ConcreteDomain.hh"

ConcreteDomain::ConcreteDomain() {}

std::shared_ptr<std::map<std::string, std::uint64_t>> ConcreteDomain::init() {
  _env = std::make_shared<std::map<std::string, std::uint64_t>>();
  return _env;
}

std::shared_ptr<std::map<std::string, std::uint64_t>> ConcreteDomain::bottom() {
  return nullptr;
}

std::shared_ptr<std::map<std::string, std::uint64_t>>
ConcreteDomain::get_env() const {
  return _env;
}
