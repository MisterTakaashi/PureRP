print("JE SUIS LE CLIENT !")

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

-- timer.Simple( 2, function() 
-- 	sound.Play( "npc/metropolice/vo/on2.wav", LocalPlayer():GetPos(), 0, 100, 1 )
--  end )