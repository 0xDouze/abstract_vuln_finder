abstract_vuln_finder
====================

This project aims to do abstract interpretation on llvm bitcode/IR to find vulnerabilities.
Will focus on buffer overflows for now.

#Dependencies:
- C++17
- LLVM (recent enough)
- googletest - Autodownloaded during build
- Apron library (https://github.com/antoinemine/apron)
#How to use:
- mkdir build
- cd build
- cmake .. -DENABLE_APRON=1 -DCMAKE_BUILD_TYPE=Release
- [insert mcsema commands to get bc file]
- opt -instnamer (-O3) [BC file] -o [BC file]
- ./abstract_vuln [IR/BC file]

Or you can use the shared library [abstract_vuln_finder.so]

A doxygen is generated in docs/ when compiled in release mode
(cmake .. -DCMAKE_BUILD_TYPE=Release)
