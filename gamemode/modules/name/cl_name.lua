local F1Menu

local function openNameMenu()
  F1Menu = F1Menu or vgui.Create("PureRP_Panel_ChangeName")
end

net.Receive("PureRP_ChooseName", openNameMenu)

concommand.Add("PureRP_OpenNameMenu", openNameMenu)