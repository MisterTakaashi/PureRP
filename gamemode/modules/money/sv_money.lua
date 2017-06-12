local PLAYER = FindMetaTable("Player")

function PLAYER:SetMoney(money)
	self.Money = money
	
	net.Start("PureRP_SetMoney")
		net.WriteDouble(money)
	net.Send(self)
end

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SetMoney")