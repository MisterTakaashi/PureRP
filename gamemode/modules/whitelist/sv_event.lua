hook.Add("PlayerInitialSpawn", "PureRP_Hook_InitialAPICall", function(ply)
  if PureRP.Config.Modules.Whitelist.enabled then
    PureRP.api.get('/events/' .. PureRP.Config.Modules.Event.ID .. '/participants', function(code, body)
      local founded = false

      for _, participant in pairs(body) do
        if participant.player.id == ply:SteamID64() then
          -- Le participant a été trouvé
          founded = true
        end
      end

      if not founded then
        ply:Kick("Vous n'êtes pas enregistré pour cet évènement :/\nPassez sur events.puresystem.eu pour vous inscrire !")
        return
      end

      hook.Run("PureRPPlayerConnected", ply)
    end)
  else
    hook.Run("PureRPPlayerConnected", ply)
  end
end)