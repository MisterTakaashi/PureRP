local PANEL = {}

surface.CreateFont("AccessPermitTitle", {
  size = 35,
  weight = 600,
  antialias = true,
  shadow = false,
  font = "VT323"
})

AccessorFunc(PANEL, "m_bgColor", "BackgroundColor")
function PANEL:Init()
	self:SetSize(350, 500)
  self:SetPos(ScrW() / 2 - 150, ScrH() / 2 - 200)

  self:SetSkin("PureSkin")

  self:MakePopup()

  self.background = vgui.Create("DImage", self)
  self.background:SetSize(350, 450)
  self.background:SetImage("materials/access_permit.png")

  self.nameEntry = vgui.Create("DTextEntry", self)
  self.nameEntry:SetFont("AccessPermitTitle")
  self.nameEntry:SetPos(38, 112)
  self.nameEntry:SetTextColor(Color(105,102,140))
  self.nameEntry:SetSize(270, 25)
  self.nameEntry:SetText("Entrez vote nom")
  self.nameEntry:SizeToContents()
  self.nameEntry:SetPaintBorderEnabled(false)
  self.nameEntry:SetPaintBackground(false)
  self.nameEntry:SetDrawLanguageID(false)
  self.nameEntry.OnGetFocus = function(this)
    this:SetText("")
  end

  self.validButton = vgui.Create("DButton", self)
  self.validButton:SetPos(200, 450)
  self.validButton:SetSize(150, 30)
  self.validButton:SetText("")
  self.validButton.DoClick = function(this)
    self:Callback()
    self:Remove()
  end
  self.validButton.Paint = function(this, w, h)
    if self.nameEntry:GetText() != "Entrez vote nom" && self.nameEntry:GetText():len() > 5 then
      draw.RoundedBoxEx(4, 0, 0, w, h, Color(0, 150, 0), false, true, false, true)
      draw.DrawText("Valider la carte de séjour", "DermaDefault", w/2, 7, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    end
  end
end

function PANEL:GetPermitName()
  return self.nameEntry:GetText()
end

function PANEL:Callback()

end

derma.DefineControl("PureRP_Panel_AccessPermit", "", PANEL, "EditablePanel")