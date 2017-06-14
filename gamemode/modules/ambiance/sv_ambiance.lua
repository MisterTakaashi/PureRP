hook.Add("PlayerInitialSpawn", "PureRP_Hook_AmbianceStarted", function(ply)
  net.Start("PureRP_BeginAmbiance")
	net.Send(ply)
end)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_BeginAmbiance")