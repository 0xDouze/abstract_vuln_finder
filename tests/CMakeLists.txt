configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
endif()

# Prevent overriding the parent project's compiler/linker
# settings on Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Add googletest directly to our build. This defines
# the gtest and gtest_main targets.
add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/googletest-src
                 ${CMAKE_CURRENT_BINARY_DIR}/googletest-build
                 EXCLUDE_FROM_ALL)

# The gtest/gtest_main targets carry header search path
# dependencies automatically when using CMake 2.8.11 or
# later. Otherwise we have to add them here ourselves.
if (CMAKE_VERSION VERSION_LESS 2.8.11)
  include_directories("${gtest_SOURCE_DIR}/include")
endif()
add_executable(test_ir_manip test_ir_manip.cc)
target_link_libraries(test_ir_manip abstract_vuln_finder)
target_link_libraries(test_ir_manip ${llvm_libs})
add_test(NAME IR_manip COMMAND test_ir_manip)

add_executable(test_func Core/CFG/test_func.cc)
target_link_libraries(test_func ${llvm_libs} abstract_vuln_finder)
add_test(NAME Func COMMAND test_func)

add_executable(test_graph Core/CFG/test_graph.cc)
target_link_libraries(test_graph ${llvm_libs} abstract_vuln_finder)
add_test(NAME Graph COMMAND test_graph)

add_executable(test_cfg Core/CFG/test_cfg.cc)
target_link_libraries(test_cfg ${llvm_libs} abstract_vuln_finder)
add_test(NAME CFG COMMAND test_cfg)

add_test(crashTest ${CMAKE_CURRENT_SOURCE_DIR}/Core/CFG/test_transform_to_cfg.sh)
