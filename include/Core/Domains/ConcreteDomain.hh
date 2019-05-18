#pragma once

#include <cstdint>
#include <map>
#include <memory>
#include <set>

class ConcreteDomain {
public:
  using Env = std::shared_ptr<std::map<std::string, std::uint64_t>>;
  ConcreteDomain();
  Env init();
  Env bottom();
  Env assign(std::map<std::string, std::uint64_t> &map);
  Env get_env() const;

private:
  Env _env; // instruction as key
  std::set<std::uint64_t> _val_set;
};
