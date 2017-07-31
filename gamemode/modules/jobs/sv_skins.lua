function GM:PlayerSetModel(ply)
  -- On ajoute un timer pour ne pas rentrer en conflit avec l'addon de corpses
  timer.Simple(10, function()
    if not ply && not ply:IsPlayer() then
      ply:SetModel("models/player/odessa.mdl")
      return
    end
    local skin = ply:GetJob():GetSkin() or "models/player/odessa.mdl"
    ply:SetModel(skin)
  end)
end