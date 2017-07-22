local PANEL = {}

AccessorFunc(PANEL, "m_bgColor", "BackgroundColor")
function PANEL:Init()
	self:SetSize(450, 350)
  self:SetPos(ScrW() / 2 - 225, ScrH() / 2 - 175)

  self:SetSkin("PureSkin")

  self:MakePopup()
  
  self:SetBackgroundColor(PureRP.Colors.Black)

  self.test = vgui.Create("PureRP_Panel_ChangeNameTitle", self)
  self.test:SetWide(self:GetWide())
  self.test:SetPos(0, 10)
  self.test:SetText("CHOISISSEZ VOTRE NOM")
end

function PANEL:Paint()
    local w, h = self:GetSize()
    draw.RoundedBoxEx(4, 0, 0, w, h, self:GetBackgroundColor(), false, true, false, true)
end

derma.DefineControl("PureRP_Panel_ChangeName", "", PANEL, "EditablePanel")