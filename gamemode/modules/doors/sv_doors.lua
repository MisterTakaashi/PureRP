hook.Add( "KeyPress", "keypress_use_hi", function( ply, key )
	if (key == IN_USE) then
    ent = ply:GetEyeTrace().Entity

    if not ent:isKeysOwnable() then return end

    ent:Fire("open", "", 0)
    ent:Fire("setanimation", "open", 0)
	end
end )