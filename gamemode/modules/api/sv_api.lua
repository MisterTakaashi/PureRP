PureRP.api = PureRP.api or {}

-- Ok, impossible de traiter les nombres 64 bits facilement, alors on les transforme en string jusque nouvel ordre
-- Si un jour il me vient un éclair de génie, il faudra que je revienne ici, pourtant je laisse ce commentaire inutile et qui ne sera probablement jamais lu
-- Quoi qu'il en soit, moi c'est MisterTakaashi alors bisous a vous si vous lisez ces lignes, XOXOXO
-- PS: On me force a écouter Herp the Derp depuis 3 jours, mais bon, la musique est plutôt cool, allez voir ça sur YouTube un jour
local function parseSteamid64(json)
  return string.gsub(json, '("id":)(%d%d%d%d%d%d%d%d%d%d%d%d%d+),', "%1\"%2\",");
end

function PureRP.api.get(endpoint, success, error)
  local parameters = {
    method = 'GET',
    url = PureRP.Config.Modules.API.URL .. endpoint,
    success = function(code, body, headers)
      body = parseSteamid64(body)

      local bodyParsed = util.JSONToTable(body)

      success(code, bodyParsed, headers)
    end,
    failed = function(err)
      error(err)
    end
  }

  if PureRP.Config.Debug then
    print("Requête GET à l'API sur l'URL '" .. PureRP.Config.Modules.API.URL .. endpoint .. "'")
  end

  HTTP(parameters)
end

function PureRP.api.post(endpoint, params, success, error)
  local parameters = {
    method = 'POST',
    url = PureRP.Config.Modules.API.URL .. endpoint,
    parameters = params,
    success = function(code, body, headers)
      body = parseSteamid64(body)

      local bodyParsed = util.JSONToTable(body)

      success(code, bodyParsed, headers)
    end,
    failed = function(err)
      error(err)
    end
  }

  HTTP(parameters)
end

function PureRP.api.post(endpoint, params, success, error)
  local parameters = {
    method = 'PUT',
    url = PureRP.Config.Modules.API.URL .. endpoint,
    parameters = params,
    success = function(code, body, headers)
      body = parseSteamid64(body)

      local bodyParsed = util.JSONToTable(body)

      success(code, bodyParsed, headers)
    end,
    failed = function(err)
      error(err)
    end
  }

  HTTP(parameters)
end

function PureRP.api.delete(endpoint, success, error)
  local parameters = {
    method = 'DELETE',
    url = PureRP.Config.Modules.API.URL .. endpoint,
    success = function(code, body, headers)
      body = parseSteamid64(body)

      local bodyParsed = util.JSONToTable(body)

      success(code, bodyParsed, headers)
    end,
    failed = function(err)
      error(err)
    end
  }

  HTTP(parameters)
end