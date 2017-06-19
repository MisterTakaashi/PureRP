local ENTITY = FindMetaTable("Entity")

local doors = {}

function ENTITY:drawOwnableInfo()
  -- local x, y = ScrW() / 2, ScrH() / 2
  if self.DoorData then
     return "Bar de " .. self.DoorData.Owner:Nick()
  end

  return "Non loué"
end

net.Receive("PureRP_SendDoorsData", function()
  doors = net.ReadTable()

  for _, v in pairs(doors) do
    -- On trouve l'entité de la porte grace à son ID
    entity = ents.GetByIndex(v.EntId)

    -- On set les DoorData pour le côté client
    entity.DoorData = v
  end

  print("RECEPTION DES PORTES")
  PrintTable(doors)
end)