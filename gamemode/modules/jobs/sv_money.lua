local function giveMoney(ply)
  timer.Simple(12, function()
    local money = ply:GetJob():GetStartupMoney()

    ply:SetMoney(money)
  end)
end
hook.Add("PlayerSpawn", "PureRP_Hook_PlayerAssignMoney", giveMoney)