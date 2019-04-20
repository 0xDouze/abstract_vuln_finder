cmake_minimum_required(VERSION 3.4.3)
project(abstract_vuln_finder)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.make in: ${LLVM_DIR}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -std=c++17")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG} -O0 -g")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE} -Wall -Wextra -O2")

message(STATUS "Cmake build type: " ${CMAKE_BUILD_TYPE})

set(CMAKE_VERBOSE_MAKEFILE ON)

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
add_executable(abstract_vuln_finder src/main.cc
				    src/IR_manip.cc
	)

llvm_map_components_to_libnames(llvm_libs)

target_link_libraries(abstract_vuln_finder LLVM ${llvm_libs})
