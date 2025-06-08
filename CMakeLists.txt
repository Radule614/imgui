cmake_minimum_required(VERSION 3.15)
project(ImGui LANGUAGES CXX)

# Set output directories based on configuration
set(OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin)
set(OUTPUT_DIR_INT ${CMAKE_BINARY_DIR}/bin-int)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_DIR}/$<CONFIG>/ImGui)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIR}/$<CONFIG>/ImGui)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR}/$<CONFIG>/ImGui)

# Create the static library
add_library(ImGui STATIC
        imgui.cpp
        imgui_draw.cpp
        imgui_widgets.cpp
        imgui_demo.cpp
        imgui.h
        imconfig.h
        imgui_internal.h
        imstb_rectpack.h
        imstb_textedit.h
        imstb_truetype.h
)

# Set C++ standard and other compile options
target_compile_features(ImGui PRIVATE cxx_std_17)

# OS-specific settings
if(WIN32)
    # Windows specific settings
    target_compile_definitions(ImGui PRIVATE _CRT_SECURE_NO_WARNINGS)
elseif(UNIX AND NOT APPLE)
    # Linux specific settings
    set_target_properties(ImGui PROPERTIES POSITION_INDEPENDENT_CODE ON)
endif()

# Configuration-specific settings
target_compile_options(ImGui PRIVATE
        $<$<CONFIG:Debug>:-g>
        $<$<CONFIG:Release>:-O3>
)

target_compile_definitions(ImGui PRIVATE
        $<$<CONFIG:Debug>:DEBUG>
        $<$<CONFIG:Release>:NDEBUG>
)