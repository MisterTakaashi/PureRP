net.Receive("PureRP_BeginAmbiance", function()
  timer.Simple( 5, function() sound.Play("ambient/atmosphere/ambience6.wav", LocalPlayer():GetPos(), 0, 100, 0.55) end)
end)