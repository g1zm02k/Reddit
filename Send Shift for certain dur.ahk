#Persistent
CoordMode ToolTip
SetTimer tT,100

$LShift::
  Send {Blind}{LShift Down}
  Sleep 85
  Send {Blind}{LShift Up}
  Keywait LShift
Return

tT:
  k1:=GetKeyState("LShift")
  ToolTip % k1,200,500
Return