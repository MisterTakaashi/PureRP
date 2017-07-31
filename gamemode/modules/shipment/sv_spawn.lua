local function spawnShipment()
  local crate = ents.Create("pure_weapon_shipment")

  local len = table.getn(PureRP.Config.Modules.Shipment.weapons_spawnable)
  local rand = math.random(1, len)
  local nbr = math.random(1, 5)
  crate:SetClassWeapon(PureRP.Config.Modules.Shipment.weapons_spawnable[rand])
  crate:SetNumber(nbr)

  if PureRP.Config.Modules.Shipment then
    local len = table.getn(PureRP.Config.Modules.Shipment.spawns)
    local rand = math.random(1, len)

    if (!IsValid(crate)) then return end
    crate:SetPos(PureRP.Config.Modules.Shipment.spawns[rand])
    crate:Spawn()
  end

  timer.Simple(5, spawnShipment)
end



hook.Add("InitPostEntity", "PureRP_Hook_SpawnFirstShipment", function()
	timer.Simple(5, spawnShipment)
end)