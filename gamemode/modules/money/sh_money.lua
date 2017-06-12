local PLAYER = FindMetaTable("Player")

PLAYER.Money = nil

function PLAYER:GetMoney()
	return self.Money or 0
end