function GM:PlayerSetModel(ply)
  -- On ajoute un timer pour ne pas rentrer en conflit avec l'addon de corpses
  timer.Simple(5, function()
    local skin = ply:GetJob():GetSkin() or "models/player/odessa.mdl"
    ply:SetModel(skin)
  end)
end