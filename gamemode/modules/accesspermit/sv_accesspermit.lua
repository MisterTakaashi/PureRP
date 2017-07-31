local function processAccessPermit(len, ply)
  ply:SetRPName(net.ReadString())
end

net.Receive("PureRP_SendAccessPermit", processAccessPermit)

hook.Add("PlayerInitialSpawn", "Pure_Hooks_ChangeName", function(ply)
  net.Start("PureRP_OpenAccessPermit")
  net.Send(ply)
end)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_SendAccessPermit")
util.AddNetworkString("PureRP_OpenAccessPermit")