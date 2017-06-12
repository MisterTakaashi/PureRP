GM.Name = "Pure RP"
GM.Author = "MisterTakaashi && Achild0"
GM.Email = "N/A"
GM.Website = "puresystem.eu"

-- Variable globale pour stocker un max de trucs
PureRP = PureRP or {}

-- On dérive du gamemode Sandbox
DeriveGamemode("sandbox")

-- On inclue la config et la config spécifique du scenario
include("config/sh_config.lua")
include("config/scenarios/sh_" .. PureRP.Config.Scenario .. ".lua")