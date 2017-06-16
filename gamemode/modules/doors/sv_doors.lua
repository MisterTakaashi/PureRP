local ENTITY = FindMetaTable("Entity")

hook.Add("KeyPress", "PureRP_Hook_KeyPressUseDoor", function( ply, key )
	if (key == IN_USE) then
    ent = ply:GetEyeTrace().Entity

    if not ent:isKeysOwnable() then return end

    ent:Fire("open", "", 0)
    ent:Fire("setanimation", "open", 0)

    ent:SetDoorData("Truc", "moi")

    PrintTable(ent:GetDoorData())
	end
end)

-- Envoyer au client les data a chaque modif

function ENTITY:getDoorData()
    if not self:isKeysOwnable() then return {} end

    self.DoorData = self.DoorData or {}
    return self.DoorData
end

function ENTITY:SetDoorData(name, owner)
  if not self:isKeysOwnable() then return end

  ENTITY.DoorData = {
    Name = name,
    Owner = owner
  }
end