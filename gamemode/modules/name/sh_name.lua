local PLAYER = FindMetaTable("Player")

function PLAYER:RPName()
  local nameFromNW = self:GetNWString('rpname')

  if nameFromNW == '' then return self:Name() end

  return nameFromNW
end