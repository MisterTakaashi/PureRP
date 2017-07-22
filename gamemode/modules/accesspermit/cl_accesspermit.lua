local nameMenu

local function openAccessPermit()
  nameMenu = vgui.Create("PureRP_Panel_AccessPermit")
  nameMenu.Callback = function()
    net.Start("PureRP_SendAccessPermit")
    net.WriteString(nameMenu:GetPermitName())
    net.SendToServer()
  end
end

concommand.Add("PureRP_OpenAccessPermit", openAccessPermit)