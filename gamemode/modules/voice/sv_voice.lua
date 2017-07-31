function GM:PlayerCanHearPlayersVoice(listener, talker)
  return (listener:GetPos():Distance(talker:GetPos()) <= 450), true
end

local function DisableNoclip( ply )
	return true
end
hook.Add( "PlayerNoClip", "DisableNoclip", DisableNoclip )