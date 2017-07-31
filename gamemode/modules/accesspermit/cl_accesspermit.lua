local nameMenu

local function openAccessPermit()
  nameMenu = vgui.Create("PureRP_Panel_AccessPermit")
  nameMenu.Callback = function()
    net.Start("PureRP_SendAccessPermit")
    net.WriteString(nameMenu:GetPermitName())
    net.SendToServer()
  end
end

net.Receive("PureRP_OpenAccessPermit", openAccessPermit)

concommand.Add("PureRP_OpenAccessPermit", openAccessPermit)