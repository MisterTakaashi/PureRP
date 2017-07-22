local function processAccessPermit(len, ply)
  ply:SetRPName(net.ReadString())
end

net.Receive("PureRP_SendAccessPermit", processAccessPermit)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SendAccessPermit")