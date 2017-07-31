local PLAYER = FindMetaTable("Player")

function PLAYER:SetRPName(name)
  self:SetNWString('rpname', name)
end

hook.Add("PureRPPlayerConnected", "PureRP_Hook_PlayerChooseName", function(ply)
  if (PureRP.Config.Modules.Name.ChooseOnSpawn) then
    net.Start("PureRP_ChooseName")
    net.Send(ply)
  end
end)

-- Enregistrement des Net messages
util.AddNetworkString("PureRP_ChooseName")