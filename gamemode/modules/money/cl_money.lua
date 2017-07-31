net.Receive("PureRP_SetMoney", function()
  LocalPlayer().Money = net.ReadDouble()
end)

local function drawMoney()
  surface.SetFont("HudHintTextLarge")
	surface.SetTextColor(254, 203, 0)
	surface.SetTextPos(ScrW() - 200, 10)
	surface.DrawText("PureRP by PureSystem 0.1")

  surface.SetFont("HudHintTextLarge")
	surface.SetTextColor(255, 255, 255)
	surface.SetTextPos(50, ScrH() - 20)
	surface.DrawText(LocalPlayer():GetMoney() .. ' ' .. PureRP.Config.Modules.Money.Currency)
end

hook.Add("HUDPaint", "clzdpqz", drawMoney)