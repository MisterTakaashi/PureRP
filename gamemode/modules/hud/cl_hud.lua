local tab = {
	["$pp_colour_addr"] = -0.1,
	["$pp_colour_addg"] = -0.1,
	["$pp_colour_addb"] = -0.05,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 1,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

function GM:RenderScreenspaceEffects()
  -- Modification des couleurs de la vue
	DrawColorModify(tab)

  -- Ajout de l'overlay
  DrawMaterialOverlay("overlay", 0)

	-- Pour les combined
	-- DrawMaterialOverlay( "effects/combine_binocoverlay.vmt", 0 )
end

-- local function DrawEntityDisplay()
--     local tr = LocalPlayer():GetEyeTrace()

--     if IsValid(tr.Entity) and tr.Entity:isKeysOwnable() and tr.Entity:GetPos():DistToSqr(LocalPlayer():GetPos()) < 40000 then
--         -- tr.Entity:drawOwnableInfo()
-- 		cam.Start3D2D( Vector(tr.Entity:GetPos().x, tr.Entity:GetPos().y, tr.Entity:GetPos().z), Angle(0, 0, 0), 1 )
-- 			draw.DrawText("YOOOOOOOOOOOP", "CloseCaption_Bold", 0, 0, Color(0, 255, 255, 255), TEXT_ALIGN_CENTER )
-- 		cam.End3D2D()
--     end
-- end

-- hook.Remove( "PreDrawTranslucentRenderables", "DarkRP_3D2D_Doors" )
-- function GM:PostDrawTranslucentRenderables()
-- 	DrawEntityDisplay()
-- end

-- function GM:HUDPaint()
--     -- self.Sandbox.HUDPaint(self)
-- end

surface.CreateFont( "DoorDisplayTitleFont", {
	font = "Trebuchet24",
	size = 40,
	weight = 1500, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
	underline = false, 
	italic = false, 
	strikeout = false, 
	symbol = false, 
	rotary = false, 
	shadow = false, 
	additive = false, 
	outline = false,
} )

hook.Add( "PostDrawTranslucentRenderables", "sh_doordisplay_drawdisplay", function()
	for _, door in pairs( ents.GetAll() ) do
		if not door:isKeysOwnable() then continue end

		if door:GetPos():Distance( LocalPlayer():GetShootPos() ) > 250 then continue end

		local dimens = door:OBBMaxs() - door:OBBMins()
			local center = door:OBBCenter()
			local min, j 

			for i=1, 3 do
				if !min or dimens[i] <= min then
					j = i
					min = dimens[i]
				end
			end

		local center = door:OBBCenter()

		local norm = Vector()
			norm[j] = 1

			local lang = Angle( 0, norm:Angle().y + 90, 90 )

		if door:GetClass() == "prop_door_rotating" then
				lpos = Vector( center.x, center.y, 10 ) + lang:Up() * (min / 6)
			else
				lpos = center + Vector( 0, 0, 20 ) + lang:Up() * ((min / 2) - 0.1)
			end

			local ang = door:LocalToWorldAngles( lang )
			local dot = ang:Up():Dot( 
				LocalPlayer():GetShootPos() - door:WorldSpaceCenter()
			)

			if dot < 0 then
				lang:RotateAroundAxis( lang:Right(), 180 )

				lpos = lpos - (2 * lpos * -lang:Up())
				ang = door:LocalToWorldAngles( lang )
			end

			local pos = door:LocalToWorld( lpos )
			local scale = 0.14

			local ct = CurTime()

			owner = ""
			if door:GetDoorData() then
				owner = door:GetDoorData().Owner
			end

		cam.Start3D2D( pos, ang, 0.1 )
			draw.SimpleTextOutlined(
				"Club de pute" .. owner,
				"DoorDisplayTitleFont",
				0, 10,
				Color(255, 255, 255, 255),
				TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM,
				1, Color(0, 0, 0, 255)
			)
		cam.End3D2D()
	end
end)