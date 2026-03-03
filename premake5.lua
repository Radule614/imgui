project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "On"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_widgets.cpp",
		"imgui_demo.cpp",
		"imgui.h",
		"imconfig.h",
		"imgui_internal.h",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_tables.cpp",
		"backends/imgui_impl_glfw.cpp",
		"backends/imgui_impl_opengl3.cpp"
	}

    includedirs
	{
        ".",
        "../glfw/include"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
        defines { "_CRT_SECURE_NO_WARNINGS" }

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
