dofile("script/actions/codeblocks/_codeblocks.lua")
dofile("script/actions/codeblocks/codeblocks.lua")

local platformData
if (os.is64bit()) then
    platformData = {"x64", "x86"}
else
    platformData = {"x86", "x64"}
end

workspace "MicroPather"
    configurations { "DebugDynamic", "ReleaseDynamic", "DebugStatic", "ReleaseStatic" }
    platforms(platformData)

    filter "platforms:x86"
        architecture "x32"

    filter "platforms:x64"
        architecture "x86_64"

    filter {}

project "MicroPather"
    language "C++"
    targetname "micropather"
    files { "micropather.h", "micropather.cpp" }

	filter "configurations:*Static"
    	kind "StaticLib"

	filter "configurations:*Dynamic"
    	kind "SharedLib"

    filter "configurations:Debug*"
        symbols "On"
        targetsuffix "-d"

    filter "configurations:Release*"
        optimize "On"
