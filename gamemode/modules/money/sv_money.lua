local PLAYER = FindMetaTable("Player")

function PLAYER:SetMoney(money)
	self.Money = money
	
	net.Start("PureRP_SetMoney")
		net.WriteDouble(money)
	net.Send(self)
end

local function giveMoney(giver, money)
	local player = giver:GetEyeTrace().Entity

	if not player:IsPlayer() then return end

	if giver != -1 && (giver:GetMoney() - money) < 0 then
		print("Pas assez d'argent")
		return
	end

	giver:SetMoney(giver:GetMoney() - money)
	player:SetMoney(player:GetMoney() + money)
end 

hook.Add("PlayerSay", "PureRP_Hook_GiveMoney", function(ply, text, public)
	text = string.Split(string.lower(text), " ")
	if (text[1] == "/givemoney") then
		giveMoney(ply, tonumber(text[2]))
	end
end)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SetMoney")