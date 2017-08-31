dofile("script/actions/codeblocks/_codeblocks.lua")
dofile("script/actions/codeblocks/codeblocks.lua")

local platformData
if (os.is64bit()) then
    platformData = {"x64", "x86"}
else
    platformData = {"x86", "x64"}
end

local root = "../"

workspace "MicroPather"
    configurations { "DebugDynamic", "ReleaseDynamic", "DebugStatic", "ReleaseStatic" }
    platforms(platformData)
    location("solution/" .. _ACTION)

    filter "platforms:x86"
        architecture "x32"

    filter "platforms:x64"
        architecture "x86_64"

    filter {}

project "MicroPather"
    language "C++"
    targetname "micropather"
    files { root .. "micropather.h", root .. "micropather.cpp" }

	filter "configurations:*Static"
    	kind "StaticLib"

	filter "configurations:*Dynamic"
    	kind "SharedLib"

    filter "configurations:Debug*"
        symbols "On"
        targetsuffix "-d"

    filter "configurations:Release*"
        optimize "On"

project "Dungeon Demo"
    language "C++"
    targetname "dungeon"
    files { root .. "dungeon.cpp" }
    kind "ConsoleApp"
    dependson { "MicroPather" }

    filter "configurations:Debug*"
        symbols "On"
        targetsuffix "-d"

    filter "configurations:Release*"
        optimize "On"

project "Speed Test"
    language "C++"
    targetname "speed"
    files { root .. "speed.cpp" }
    kind "ConsoleApp"
    dependson { "MicroPather" }

    filter "configurations:Debug*"
        symbols "On"
        targetsuffix "-d"

    filter "configurations:Release*"
        optimize "On"

