PureRP.job = PureRP.job or {}

local PLAYER = FindMetaTable("Player")

function PLAYER:GetJob()
	return jobs[self:GetNWString("ActualJob")]
end

local jobs = {}

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

  jobs[className] = job
end

function PureRP.job.GetAll()
  return jobs
end

function PureRP.job.GetByClassName(className)
	return jobs[className]
end