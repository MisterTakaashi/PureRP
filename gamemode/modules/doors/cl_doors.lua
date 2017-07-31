local ENTITY = FindMetaTable("Entity")

local doors = {}

function ENTITY:drawOwnableInfo()
  -- local x, y = ScrW() / 2, ScrH() / 2
  if self.DoorData && self.DoorData.Owner then
    local player = player.GetBySteamID64(self.DoorData.Owner)
    if player then
      local playerName = player:RPName() or "iconnu"
      return "Bar de " .. playerName
    end
  end

  return "Non loué"
end

net.Receive("PureRP_SendDoorsData", function()
  for _, door in pairs(doors) do
    entity = ents.GetByIndex(door.EntId)

    entity.DoorData = nil
  end

  doors = net.ReadTable()

  for _, v in pairs(doors) do
    -- On trouve l'entité de la porte grace à son ID
    entity = ents.GetByIndex(v.EntId)

    -- On set les DoorData pour le côté client
    entity.DoorData = v
  end
end)