local PLAYER = FindMetaTable("Player")

function PLAYER:SetMoney(money)
	self.Money = money
	
	net.Start("PureRP_SetMoney")
		net.WriteDouble(money)
	net.Send(self)
	
	SqlDB.Query("UPDATE sourcerp_players SET money = '"..money.."' WHERE  steamid = '"..self:SteamID().."'")
end

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SetMoney")