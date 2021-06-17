CoordMode ToolTip
SetTimer tX,100

!c::Clipboard:="Pos: " x "," y "`nID: " w "`nCls: " c

tX:
  MouseGetPos x,y,w,c
  ToolTip % "Pos: " x "," y "`nID: " w "`nCls: " c,200,500
Return