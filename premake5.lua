project "assimp"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  systemversion "latest"
  staticruntime "On"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  warnings "Off"

  defines {
    "ASSIMP_BUILD_NO_C4D_IMPORTER", -- Cinema4D is MSVC only and needs some weird headers to work
    "OPENDDL_STATIC_LIBARY",
  }

  files {
    "code/**.cpp",
    "code/**.h",
    "contrib/irrXML/*.cpp",
    "contrib/irrXML/*.h",
    "contrib/unzip/*.c",
    "contrib/unzip/*.h",
    "contrib/openddlparser/code/*.cpp",
    "contrib/poly2tri/poly2tri/**.cc",
    "contrib/clipper/*.cpp",
    "contrib/zlib/*.c",
    "contrib/zlib/*.h"
  }

  includedirs {
    "config/",
    "include/",
    "contrib/irrXML/",
    "contrib/rapidjson/include/",
    "contrib/openddlparser/include/",
    "contrib/unzip/",
    "contrib/zlib/",
    "./"
  }

  removefiles {
    "code/Importer/IFC/IFCReaderGen_4.*",
  }

  filter "system:windows"
    systemversion "latest"
    cppdialect "C++17"
    staticruntime "On"

    buildoptions { "/bigobj" }
    defines { "_CRT_SECURE_NO_WARNINGS" }

  filter "configurations:Debug"
    defines "ULLR_DEBUG"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    defines "ULLR_RELEASE"
    runtime "Release"
    optimize "on"

  filter "configurations:Dist"
    defines "ULLR_DIST"
    runtime "Release"
    optimize "on"