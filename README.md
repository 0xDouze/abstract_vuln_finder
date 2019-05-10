# abstract_vuln_finder

Contains (not yet finished) a framework for doing hacky abstract interpretation on llvm IR.
Very very much a proof of concept to find vulnerabilities on lifted llvm IR using mcsema.
Let's see if it works or not :D (probably not haha)

Dependencies:
LLVM (recent enough)
googletest - Autodownloaded during build


How to use:
mkdir build
cd build
cmake ..
[insert mcsema commands to get bc file]
opt -instnamer -O3 [BC file] -o [BC file]
./abstract_vuln [IR/BC file]

Or you can use the shared library [abstract_vuln_finder.so]

A doxygen is generated in docs/ when compiled in release mode
(cmake .. -DCMAKE_BUILD_TYPE=Release)

Use at your own risk :P
