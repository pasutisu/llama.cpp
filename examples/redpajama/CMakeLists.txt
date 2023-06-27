add_library(gptneox OBJECT
            gptneox.cpp
            ../../ggml.h
            gptneox.h
            gptneox-util.h)

target_include_directories(gptneox PUBLIC .)
target_compile_features(gptneox PUBLIC c_std_11)

add_library(common-gptneox OBJECT
            common-gptneox.cpp
            common-gptneox.h)

target_include_directories(common-gptneox PUBLIC .)
target_compile_features(common-gptneox PUBLIC c_std_11)

add_executable(quantize-gptneox quantize-gptneox.cpp)
target_link_libraries(quantize-gptneox PRIVATE ggml gptneox ${CMAKE_THREAD_LIBS_INIT})
target_compile_features(quantize-gptneox PRIVATE cxx_std_11)
if(TARGET BUILD_INFO)
  add_dependencies(quantize-gptneox BUILD_INFO)
endif()

add_executable(redpajama main-redpajama.cpp)
target_link_libraries(redpajama PRIVATE ggml gptneox common-gptneox ${CMAKE_THREAD_LIBS_INIT})
target_compile_features(redpajama PRIVATE cxx_std_11)
if(TARGET BUILD_INFO)
  add_dependencies(redpajama BUILD_INFO)
endif()

add_executable(redpajama-chat main-redpajama-chat.cpp)
target_link_libraries(redpajama-chat PRIVATE ggml gptneox common-gptneox ${CMAKE_THREAD_LIBS_INIT})
target_compile_features(redpajama-chat PRIVATE cxx_std_11)
if(TARGET BUILD_INFO)
  add_dependencies(redpajama-chat BUILD_INFO)
endif()
