local ENTITY = FindMetaTable("Entity")

local doors = {}

local function sendDoorsDataToClient(ply)
  if ply && ply:IsValid() && ply:IsPlayer() then
    print("ENVOI DES DONNEES DE PORTES AU JOUEUR " .. ply:Nick())
    net.Start("PureRP_SendDoorsData")
    net.WriteTable(doors)
    net.Send(ply)
  else
    net.Start("PureRP_SendDoorsData")
    net.WriteTable(doors)
    net.Broadcast()
  end
end

-- Envoyer au client les data a chaque modif

function ENTITY:GetDoorData()
  if not self:isKeysOwnable() then return nil end

   self.DoorData = self.DoorData or nil
   return self.DoorData
end

function ENTITY:SetDoorData(name, owner)
  if not self:isKeysOwnable() then return end

  for _, v in pairs(doors) do
    if v.EntId == self:EntIndex() then
      v.Name = name
      v.Owner = owner:SteamID64()

      sendDoorsDataToClient()

      return
    end
  end

  self.DoorData = {
    EntId = self:EntIndex(),
    Name = name,
    Owner = owner:SteamID64()
  }

  table.insert(doors, self.DoorData)

  sendDoorsDataToClient()
end

function ENTITY:OwnDoor(ply)
  if not self:isKeysOwnable() then return false end

  data = self:GetDoorData()

  if not data then
    -- Non possédé
    self:SetDoorData("Propriété privée", ply)
    print("Possession accordée")
  else
    -- Déjà à quelqu'un
    print("Tell him I said FUCK YOU")
  end 
end

hook.Add("KeyPress", "PureRP_Hook_KeyPressUseDoor", function(ply, key)
	if (key == IN_USE) then
    if not ply:GetEyeTrace().Entity:isKeysOwnable() then return end
    if ply:GetEyeTrace().Entity:GetPos():Distance(ply:GetShootPos()) > 90 then return end

    ply:GetEyeTrace().Entity:Fire("open", "", 0)
    ply:GetEyeTrace().Entity:Fire("setanimation", "open", 0)

    ply:GetEyeTrace().Entity:OwnDoor(ply)
	end
end)

hook.Add("PlayerInitialSpawn", "PureRP_Hook_InitialDoorSend", function(ply)
  timer.Simple( 7, function() sendDoorsDataToClient(ply) end)
end)

hook.Add("PlayerDisconnected", "PureRP_Hook_removeDoorOndisconnect", function(ply)
  for key, door in pairs(doors) do
  print("Test de " .. door.EntId)
    if (door.Owner == ply:SteamID64()) then
      print("TROUVE !!!! ON SUPPRILMMMMMe !")

      table.remove(doors, key)
    end
  end

  sendDoorsDataToClient()
end)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SendDoorsData")