-- On envoie les fichiers de base au client
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

-- On inclue les fichiers serveur
include("shared.lua")

-- Inclusion de tous les modules
local modulesFolder = "PureRP/gamemode/modules/"
PureRP.modules = {}
local _, modules = file.Find(modulesFolder .. "*", "LUA")
for k, v in pairs(modules) do
  -- Recherche du fichier module.json pour obtenir les infos du module
  local moduleInfoFile = modulesFolder .. v .. "/module.json"
	if file.Exists(moduleInfoFile, "LUA") then
	  local infos = util.JSONToTable(file.Read(moduleInfoFile, "LUA"))

    -- On test si le module est fait pour le scenario actuel
    if not table.HasValue(infos.scenarios, PureRP.Config.Scenario) && not infos.allScenarios then
      if PureRP.Config.Debug then
        print("Module " .. v .. " non inclu")
      end
      continue
    else
      if PureRP.Config.Debug then
        print("Module " .. v .. " inclu")
      end
    end

    -- On ajoute le module a la liste des modules
		PureRP.modules[v] = infos
	else
	  ErrorNoHalt("[PURERP] le fichier module.json est introuvable pour le module "..v.." !\n")
	end

  -- Envoi au clients de tous les fichier clients
  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. v .. "/cl_*.lua", "LUA"), true) do
    AddCSLuaFile(modulesFolder .. v .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(moduleFile .." envoyé au client")
    end
  end

  -- Inclusion et envoi des fichiers shared
  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. v .. "/sh_*.lua", "LUA"), true) do
    AddCSLuaFile(modulesFolder .. v .. "/" .. moduleFile)
    include(modulesFolder .. v .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(moduleFile .." envoyé et inclu")
    end
  end

  -- Inclusion des fichiers serveur
  for _, moduleFile in SortedPairs(file.Find(modulesFolder .. v .. "/sv_*.lua", "LUA"), true) do
    include(modulesFolder .. v .. "/" .. moduleFile)
    if PureRP.Config.Debug then
      print(moduleFile .." inclu")
    end
  end
end