local function spawnShipment()
  local crate = ents.Create("prop_physics")

  if PureRP.Config.Modules.Shipment then
    local len = table.getn(PureRP.Config.Modules.Shipment.spawns)
    local rand = math.random(1, len)

    if (!IsValid(crate)) then return end
    crate:SetModel("models/props_junk/wood_crate001a.mdl")
    crate:SetPos(PureRP.Config.Modules.Shipment.spawns[rand])
    crate:Spawn()
  end

  timer.Simple(5, spawnShipment)
end



hook.Add("InitPostEntity", "PureRP_Hook_SpawnFirstShipment", function()
	timer.Simple(5, spawnShipment)
end)