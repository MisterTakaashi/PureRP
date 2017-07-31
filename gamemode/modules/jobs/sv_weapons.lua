local function giveWeapons(ply)
  timer.Simple(12, function()
    local weapons = ply:GetJob():GetWeapons()

    for _, weapon in pairs(weapons) do
      ply:Give(weapon)
    end
  end)
end
hook.Add("PlayerSpawn", "PureRP_Hook_PlayerAssignWeapons", giveWeapons)