local PANEL = {}

function PANEL:Init()
  self:SetHeight(35)

  self.titleLabel = vgui.Create("DLabel", self)
  self.titleLabel:SetText("")
  self.titleLabel:SetFont("HUDNumber5")
  self.titleLabel:SetSize(self:GetSize() - 10)
  self.titleLabel:SetPos(5, -10)
end

function PANEL:Paint()
  local w, h = self:GetSize()
  draw.RoundedBoxEx(0, 0, h - 5, w, 5, PureRP.Colors.Gold, false, true, false, true)
end

function PANEL:SetText(text)
  self.titleLabel:SetText(text)
  self.titleLabel:SetSize(self:GetSize())
end

derma.DefineControl("PureRP_Panel_ChangeNameTitle", "", PANEL, "DPanel")