-- On envoie les fichiers de base au client
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("modules/hud/cl_hud.lua")

-- On inclue les fichiers serveur
include("shared.lua")

-- Inclusion des materials
resource.AddSingleFile("materials/overlay.vmt")
resource.AddSingleFile("materials/overlay.vtf")
resource.AddSingleFile("materials/overlaytest.vmt")
resource.AddSingleFile("materials/overlaytest.vtf")

-- Inclusion de tous les modules
local modulesFolder = GM.FolderName .. "/gamemode/modules/"
PureRP.modules = {}
local _, modules = file.Find(modulesFolder .. "*", "LUA")

for k, module in pairs(modules) do
  -- Recherche du fichier module.json pour obtenir les infos du module
  local moduleInfoFile = modulesFolder .. module .. "/module.json"
	if file.Exists(moduleInfoFile, "LUA") then
	  local infos = util.JSONToTable(file.Read(moduleInfoFile, "LUA"))

    -- On test si le module est fait pour le scenario actuel
    if not table.HasValue(infos.scenarios, PureRP.Config.Scenario) && not infos.allScenarios then
      if PureRP.Config.Debug then
        print("Module " .. module .. " non inclu")
      end
      continue
    else
      if PureRP.Config.Debug then
        print("Module " .. module .. " inclu")
      end
    end

    -- On ajoute le module a la liste des modules
		PureRP.modules[module] = infos
	else
	  ErrorNoHalt("[PURERP] le fichier module.json est introuvable pour le module " .. module .. " !\n")
	end

  -- Envoi au clients de tous les fichier clients
  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. module .. "/cl_*.lua", "LUA"), true) do
    AddCSLuaFile(modulesFolder .. module .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(modulesFolder .. module .. "/" .. moduleFile .." envoyé au client")
    end
  end

  -- Inclusion et envoi des fichiers shared
  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. module .. "/sh_*.lua", "LUA"), true) do
    AddCSLuaFile(modulesFolder .. module .. "/" .. moduleFile)
    include(modulesFolder .. module .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(moduleFile .." envoyé et inclu")
    end
  end

  -- Inclusion des fichiers serveur
  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. module .. "/sv_*.lua", "LUA"), true) do
    include(modulesFolder .. module .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(moduleFile .." inclu")
    end
  end
end