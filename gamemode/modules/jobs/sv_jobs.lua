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
		
		PrintTable(PureRP.job.GetAll())
  end)
end

hook.Add("PureRPIsReady", "PureRP_Hook_CreateJobs", fetchJobs)

hook.Add("PureRPPlayerConnected", "PureRP_Hook_PlayerAssignJob", function(ply)

end)