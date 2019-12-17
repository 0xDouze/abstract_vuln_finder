cmake_minimum_required(VERSION 3.4.3)
project(abstract_vuln_finder)

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
        ${CMAKE_CURRENT_SOURCE_DIR}/include/Core/Iterator
        ${CMAKE_CURRENT_SOURCE_DIR}/include/Core/Memory
	)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -std=c++17 -g")
#set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG} -O0 -fsanitize=address -fsanitize-address-use-after-scope -fno-omit-frame-pointer")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG} -O0")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE} -Wall -Wextra -O2")

message(STATUS "Cmake build type: " ${CMAKE_BUILD_TYPE})

set(CMAKE_VERBOSE_MAKEFILE ON)

add_compile_definitions(ENABLE_APRON)

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

set(ABS_SOURCES
  src/IR_manip.cc
  src/Core/CFG/Graph.cc
  src/Core/CFG/Func.cc
  src/Core/CFG/CFG.cc
  src/Core/CFG/TransformToCFG.cc
  src/Core/Domains/ConcreteDomain.cc
  src/Core/Domains/IntervalsInst.cc
  src/Core/Domains/Intervals.cc
  src/Core/Memory/ByteAbstraction.cc)

if (ENABLE_APRON)
  set(ABS_SOURCES ${ABS_SOURCES} src/Core/Domains/Apron/APIntervals.cc)
endif()

add_executable(abstract_vuln ${ABS_SOURCES} src/main.cc)
add_library(abstract_vuln_finder SHARED ${ABS_SOURCES})

llvm_map_components_to_libnames(llvm_libs)

target_link_libraries(abstract_vuln_finder LLVM ${llvm_libs})
target_link_libraries(abstract_vuln LLVM ${llvm_libs})
target_link_libraries(abstract_vuln_finder gtest_main)

# Change that to a findpackage
if (ENABLE_APRON)
  find_library(LIBAPRONXX NAMES apronxx HINTS "/usr/local/lib")
  find_library(LIBAPRON NAMES apron HINTS "/usr/local/lib")
  find_library(LIBMPFR NAMES mpfr HINTS "/usr/local/lib")
  find_library(LIBGMP NAMES gmp HINTS "/usr/local/lib")
  find_library(LIBGMPXX NAMES gmpxx HINTS "/usr/local/lib")
  find_library(LIBBOXMPQ NAMES boxMPQ HINTS "/usr/local/lib")
  target_link_libraries(abstract_vuln_finder ${LIBAPRONXX})
  target_link_libraries(abstract_vuln_finder ${LIBAPRON})
  target_link_libraries(abstract_vuln_finder ${LIBMPFR})
  target_link_libraries(abstract_vuln_finder ${LIBGMP})
  target_link_libraries(abstract_vuln_finder ${LIBGMPXX})
  target_link_libraries(abstract_vuln_finder ${LIBBOXMPQ})
  target_link_libraries(abstract_vuln ${LIBAPRONXX})
  target_link_libraries(abstract_vuln ${LIBAPRON})
  target_link_libraries(abstract_vuln ${LIBMPFR})
  target_link_libraries(abstract_vuln ${LIBGMP})
  target_link_libraries(abstract_vuln ${LIBGMPXX})
  target_link_libraries(abstract_vuln ${LIBBOXMPQ})
endif()

enable_testing()
add_subdirectory(tests)
