net.Receive("PureRP_SetMoney", function()
  LocalPlayer().Money = net.ReadDouble()
end)