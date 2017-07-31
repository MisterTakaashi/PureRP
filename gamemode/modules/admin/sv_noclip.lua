hook.Add("PlayerNoClip", "PureRP_Hook_ActiveNoClip", function(ply)
  if (ply:SteamID64() == '76561198024273068' || ply:SteamID64() == '76561197977662570' || ply:SteamID64() == '76561198044188822') then
    return true
  end
  
  return false
end)