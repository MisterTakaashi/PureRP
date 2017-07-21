hook.Add("PlayerNoClip", "PureRP_Hook_ActiveNoClip", function(ply)
  return ply:IsAdmin()
end)