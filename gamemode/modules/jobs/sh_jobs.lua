PureRP.job = PureRP.job or {}

local PLAYER = FindMetaTable("Player")

local jobs = {}

function PLAYER:GetJob()
	return jobs[self:GetNWString("ActualJob")]
end

function PureRP.job.Create(className, name, color)
  local job = {}

  function job:GetClassName()
    return className
  end

  function job:GetName()
    return name
  end

  function job:GetColor()
    return color
  end

  function job:GetSkin()
    for _, config in pairs(PureRP.Config.Modules.Job.skins) do
      if self:GetClassName() == "job_" .. tostring(config.id) then
        return config.skin
      end
    end
  end

  jobs[className] = job
end

function PureRP.job.GetAll()
  return jobs
end

function PureRP.job.GetByClassName(className)
	return jobs[className]
end