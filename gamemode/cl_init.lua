include("shared.lua")
include("config/cl_colors.lua")
include("config/cl_fonts.lua")

-- Inclusion des modules côté client

local modulesFolder = GM.FolderName .. "/gamemode/modules/"
local _, modules = file.Find(modulesFolder .. "*", "LUA")

for _, module in SortedPairs(modules, true) do
  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. module .. "/sh_*.lua", "LUA"), true) do
    include(modulesFolder .. module .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(modulesFolder .. module .. "/" .. moduleFile .." inclu par le client")
    end
  end

  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. module .. "/cl_*.lua", "LUA"), true) do
    include(modulesFolder .. module .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(modulesFolder .. module .. "/" .. moduleFile .." inclu par le client")
    end
  end
end