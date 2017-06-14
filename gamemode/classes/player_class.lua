AddCSLuaFile()
DEFINE_BASECLASS("player_default")

local PLAYER = {}

PLAYER.WalkSpeed 			= 125
PLAYER.RunSpeed				= 250

function PLAYER:Loadout()
	self.Player:CrosshairDisable()
end

player_manager.RegisterClass("player_sandbox", PLAYER, "player_default")