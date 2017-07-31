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

function ENTITY:SetOpenStatus()
  if not self:isKeysOwnable() then return end

  for _, v in pairs(doors) do
    if v.EntId == self:EntIndex() then
      v.Opened = !v.Opened

      sendDoorsDataToClient()
    end
  end
end

function ENTITY:SetDoorData(name, owner, toGov)
  if not self:isKeysOwnable() then return end

  for _, v in pairs(doors) do
    if v.EntId == self:EntIndex() then
      v.Name = name
      v.Owner = owner:SteamID64()
      v.Opened = true
      v.ToGov = toGov

      sendDoorsDataToClient()

      return
    end
  end

  self.DoorData = {
    EntId = self:EntIndex(),
    Name = name,
    Owner = owner:SteamID64(),
    Opened = true,
    ToGov = toGov
  }

  table.insert(doors, self.DoorData)

  sendDoorsDataToClient()
end

function ENTITY:RemoveDoorData()
  for key, door in pairs(doors) do
    if (door.EntId == self:EntIndex()) then
      print("Entity et door trouve !!!")
      table.remove(doors, key)
      self.DoorData = nil
    end
  end
end

function ENTITY:OwnDoor(ply, forGov)
  if not self:isKeysOwnable() then return false end

  data = self:GetDoorData()

  if not data then
    -- Non possédé
    self:SetDoorData("Propriété privée", ply, forGov)
    print("Possession accordée")
  else
    -- Déjà à quelqu'un
    print("Tell him I said FUCK YOU")
    -- if (data.Owner == ply:SteamID64()) then
    --   ply:GetEyeTrace().Entity:SetOpenStatus()
    -- end

    if (data.ToGov && ply:GetJob():IsInGov()) then
      ply:GetEyeTrace().Entity:SetOpenStatus()
    end
  end 
end

hook.Add("KeyPress", "PureRP_Hook_KeyPressUseDoor", function(ply, key)
	if (key == IN_USE) then
    if not ply:GetEyeTrace().Entity:isKeysOwnable() then return end
    if ply:GetEyeTrace().Entity:GetPos():Distance(ply:GetShootPos()) > 90 then return end
    if not ply:GetEyeTrace().Entity.DoorData.Opened && not ply:GetEyeTrace().Entity.DoorData.Owner == ply:SteamID64() then return end

    ply:GetEyeTrace().Entity:Fire("open", "", 0)
    ply:GetEyeTrace().Entity:Fire("setanimation", "open", 0)
	end
end)

hook.Add("ShowTeam", "PureRP_Hook_KeyPressOwnDoor", function(ply)
    if not ply:GetEyeTrace().Entity:isKeysOwnable() then return end
    if ply:GetEyeTrace().Entity:GetPos():Distance(ply:GetShootPos()) > 90 then return end
      
    -- On possède la porte
    ply:GetEyeTrace().Entity:OwnDoor(ply)
end)

hook.Add("ShowSpare1", "PureRP_Hook_KeyPressOwnDoorforGov", function(ply)
    if not ply:GetEyeTrace().Entity:isKeysOwnable() then return end
    if ply:GetEyeTrace().Entity:GetPos():Distance(ply:GetShootPos()) > 90 then return end
      
    -- On possède la porte
    ply:GetEyeTrace().Entity:OwnDoor(ply, true)
end)

hook.Add("PlayerInitialSpawn", "PureRP_Hook_InitialDoorSend", function(ply)
  timer.Simple( 20, function() sendDoorsDataToClient(ply) end)
end)

local function removeDoorOndisconnect(ply)
  local toDelete = {}

  for key, door in pairs(doors) do
    if (tostring(door.Owner) == ply:SteamID64()) then
      table.insert(toDelete, door.EntId)
    end
  end

  for _, entId in pairs(toDelete) do
    print("On toruve l'entity...")
    local entity = ents.GetByIndex(entId)
    print("L'entity est trouvée : " .. tostring(entity))
    entity:RemoveDoorData()
  end

  sendDoorsDataToClient()
end

concommand.Add("PureRP_RemoveMyDoors", removeDoorOndisconnect)

concommand.Add("PureRP_AskDoors", sendDoorsDataToClient)

hook.Add("PlayerDisconnected", "PureRP_Hook_removeDoorOnDisconnect", removeDoorOndisconnect)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SendDoorsData")