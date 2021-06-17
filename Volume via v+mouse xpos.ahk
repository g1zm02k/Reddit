#Persistent
CoordMode ToolTip
MouseGetPos ox
SetTimer tT,100

tT:
  If GetKeyState("v"){
    MouseGetPos nx
    If (nx<ox)
      SoundSet -1
    If (nx>ox)
      SoundSet +1
    SoundGet vv
    ToolTip % (Format("{:d}",vv),0),10,10
    ox:=nx
  }Else
    ToolTip
Return