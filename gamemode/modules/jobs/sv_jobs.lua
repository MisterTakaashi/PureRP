local PLAYER = FindMetaTable("Player")

function PLAYER:SetJob(className)
	self:SetNWString("ActualJob", className)
end