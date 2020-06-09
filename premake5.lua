project "Assimp"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "On"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  warnings "Off"

  defines
  {
    "ASSIMP_BUILD_NO_C4D_IMPORTER", -- Cinema4D is MSVC only and needs some weird headers to work
    "OPENDDL_STATIC_LIBARY",
    "_SILENCE_CXX17_ITERATOR_BASE_CLASS_DEPRECATION_WARNING"
  }

  files
  {
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

  includedirs
  {
    "config/",
    "include/",
    "contrib/irrXML/",
    "contrib/rapidjson/include/",
    "contrib/openddlparser/include/",
    "contrib/unzip/",
    "contrib/zlib/",
    "./"
  }

  removefiles
  {
    "code/Importer/IFC/IFCReaderGen_4.*",
  }

  filter "system:windows"
    systemversion "latest"

    buildoptions { "/bigobj" }
    defines { "_CRT_SECURE_NO_WARNINGS" }

  filter "configurations:Debug"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    runtime "Release"
    optimize "on"