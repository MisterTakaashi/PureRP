-- function GM:PlayerSpawn( ply )
-- 	ply:SetWalkSpeed(125)
-- 	ply:SetRunSpeed(300)
-- 	ply:CrosshairDisable()
-- end

local function drop(giver)
  local pos = giver:GetPos()

  local ent = ents.Create(giver:GetActiveWeapon():GetClass())
  ent:SetPos(pos + Vector(0, 100, 10))
  ent:Spawn()

  giver:StripWeapon(giver:GetActiveWeapon():GetClass())
end 

hook.Add("PlayerSay", "PureRP_Hook_drop", function(ply, text, public)
	text = string.lower(text)
	if (text == "/drop") then
		drop(ply)
	end
end)