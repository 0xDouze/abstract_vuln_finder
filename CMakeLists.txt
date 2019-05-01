cmake_minimum_required(VERSION 3.4.3)
project(abstract_vuln_finder DESCRIPTION "buffer overflow finder using abstract interpretation")

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

if (CMAKE_BUILD_TYPE MATCHES "^[Rr]elease")
	option(BUILD_DOC "Build Documentation" ON)
	find_package(Doxygen)

	if (DOXYGEN_FOUND)
		set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in)
		set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

		configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
		message("Doxygen build started")

		add_custom_target(doc_doxygen ALL
			COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
			WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
			COMMENT "Generating api documentation"
			VERBATIM )
	else (DOXYGEN_FOUND)
		message("Doxygen needs to be installed to generate the doxygen documentation")
	endif(DOXYGEN_FOUND)
endif()

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.make in: ${LLVM_DIR}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/
	${CMAKE_CURRENT_SOURCE_DIR}/include/Core/Domains
	${CMAKE_CURRENT_SOURCE_DIR}/include/Core/CFG
	)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -std=c++17 -g")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG} -O0")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE} -Wall -Wextra -O2")

message(STATUS "Cmake build type: " ${CMAKE_BUILD_TYPE})

#set(CMAKE_VERBOSE_MAKEFILE ON)

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
add_executable(abstract_vuln src/main.cc
  src/IR_manip.cc
  src/Core/CFG/Graph.cc
  src/Core/CFG/Func.cc
  src/Core/CFG/CFG.cc
  src/Core/CFG/TransformToCFG.cc)
add_library(abstract_vuln_finder SHARED
	src/IR_manip.cc
        src/Core/CFG/Graph.cc
        src/Core/CFG/Func.cc
        src/Core/CFG/CFG.cc
        src/Core/CFG/TransformToCFG.cc)
llvm_map_components_to_libnames(llvm_libs)

target_link_libraries(abstract_vuln_finder LLVM ${llvm_libs})
target_link_libraries(abstract_vuln LLVM ${llvm_libs})
target_link_libraries(abstract_vuln_finder gtest_main)
enable_testing()
add_subdirectory(tests)
