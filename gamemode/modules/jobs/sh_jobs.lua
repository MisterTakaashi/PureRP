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

  function job:IsInGov()
    local id = tonumber(string.Split(className, "_")[2])

    if table.KeyFromValue(PureRP.Config.Modules.Government, id) then return true end

    return false
  end

  function job:GetSkin()
    for _, config in pairs(PureRP.Config.Modules.Job.skins) do
      if self:GetClassName() == "job_" .. tostring(config.id) then
        return config.skin
      end
    end
  end

  function job:GetWeapons()
    for _, config in pairs(PureRP.Config.Modules.Job.weapons) do
      if self:GetClassName() == "job_" .. tostring(config.id) then
        return config.weapons
      end
    end
  end

  function job:GetStartupMoney()
    for _, config in pairs(PureRP.Config.Modules.Job.money) do
      if self:GetClassName() == "job_" .. tostring(config.id) then
        return config.money
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