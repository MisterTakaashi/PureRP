local PLAYER = FindMetaTable("Player")

function PLAYER:SetJob(className)
	self:SetNWString("ActualJob", className)
end

local function fetchJobs()
	PureRP.api.get('/scenarios/' .. PureRP.event.event_scenario.id .. '/factions', function(code, body)
		for _, faction in pairs(body) do
			for _, job in pairs(faction.event_jobs) do
				PureRP.job.Create('job_' .. job.id, job.name, "red")
			end
		end
  end)
end

local function assignJobOnConnection(ply)
	PureRP.api.get('/events/' .. PureRP.Config.Modules.Event.ID .. '/participants', function(code, body)
		for _, participant in pairs(body) do
			if (participant.player.id == ply:SteamID64()) then
				ply:SetJob("job_" .. participant.event_job.id)
			end
		end
  end)
end

hook.Add("PureRPIsReady", "PureRP_Hook_CreateJobs", fetchJobs)

hook.Add("PureRPPlayerConnected", "PureRP_Hook_PlayerAssignJob", assignJobOnConnection)