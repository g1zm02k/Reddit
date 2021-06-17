MAX:=6
F6::
  Loop{
		IMG:=Mod((A_Index-1),MAX)+1
    ImageSearch posX,posY,0,0,1920,1080,%IMG%.png
    If (ErrorLevel=0)
      Break
    Else If (ErrorLevel=2)
      MsgBox Error with disk image(s)!
  }
  Click
Return