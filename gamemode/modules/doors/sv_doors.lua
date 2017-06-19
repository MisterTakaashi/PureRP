local ENTITY = FindMetaTable("Entity")

local doors = {}

local function sendDoorsDataToClient()
  net.Start("PureRP_SendDoorsData")
  net.WriteTable(doors)
	net.Broadcast()
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
      v.Owner = owner

      sendDoorsDataToClient()

      return
    end
  end

  self.DoorData = {
    EntId = self:EntIndex(),
    Name = name,
    Owner = owner
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

    ply:GetEyeTrace().Entity:Fire("open", "", 0)
    ply:GetEyeTrace().Entity:Fire("setanimation", "open", 0)

    ply:GetEyeTrace().Entity:OwnDoor(ply)
	end
end)

hook.Add("PlayerInitialSpawn", "PureRP_Hook_InitialDoorSend", function(ply)
  net.Start("PureRP_SendDoorsData")
  net.WriteTable(doors)
	net.Send(ply)
end)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SendDoorsData")