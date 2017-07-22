local nameMenu

local function openNameMenu()
  nameMenu = nameMenu or vgui.Create("PureRP_Panel_ChangeName")
end

net.Receive("PureRP_ChooseName", openNameMenu)

concommand.Add("PureRP_OpenNameMenu", openNameMenu)