workspace "TopDownArcadeShooter"
    architecture "x64"
    configurations { "Debug", "Release" }
    startproject "TopDownArcadeShooter"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "TopDownArcadeShooter"
    location "TopDownArcadeShooter"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "aspch.h"
    pchsource "TopDownArcadeShooter/Source/aspch.cpp"

    files {
        "TopDownArcadeShooter/Source/**.h",
        "TopDownArcadeShooter/Source/**.cpp",
        "TopDownArcadeShooter/Content/**"
    }

    includedirs {
        "TopDownArcadeShooter/Source/Public",
        "TopDownArcadeShooter/Source",
        "TopDownArcadeShooter/Vendor/SFML/include"
    }

    libdirs {
        "TopDownArcadeShooter/Vendor/SFML/lib"
    }

    filter "system:windows"
        systemversion "latest"

        postbuildcommands {
            '{COPYDIR} "%{wks.location}TopDownArcadeShooter/Content" "%{cfg.targetdir}/Content"'
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
        runtime "Debug"
        links {
            "sfml-graphics-d",
            "sfml-window-d",
            "sfml-system-d",
            "sfml-audio-d",
            "sfml-network-d"
        }

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
        runtime "Release"
        links {
            "sfml-graphics",
            "sfml-window",
            "sfml-system",
            "sfml-audio",
            "sfml-network"
        }
