print("JE SUIS LE CLIENT !")

local tab = {
	["$pp_colour_addr"] = -0.3,
	["$pp_colour_addg"] = -0.3,
	["$pp_colour_addb"] = -0.2,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 1,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

function GM:RenderScreenspaceEffects()
	DrawColorModify( tab ) --Draws Color Modify effect
end