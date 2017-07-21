local PLAYER = FindMetaTable("Player")

function PLAYER:SetName(name)
  self:SetNWString('rpname', name)
end