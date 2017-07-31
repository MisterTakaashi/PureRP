local function getEventInfo()
  PureRP.api.get('/events/' .. PureRP.Config.Modules.Event.ID, function(code, body)
    PureRP.event = body

    hook.Run("PureRPIsReady")
  end)
end

concommand.Add("PureRP_RelaunchPureRP", getEventInfo)

hook.Add("InitPostEntity", "PureRP_Hook_FetchEventInfos", function() 
  timer.Simple(8, getEventInfo)
end)