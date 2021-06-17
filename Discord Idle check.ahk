#Persistent
CoordMode ToolTip
SetTimer tX,100

x1:=100,y1:=1125
x2:=100,y2:=888
fD:=0              ;'Already clicked/set' flag

SetTimer tTimer,100
tTimer:
  If (WinActive("ahk_exe Discord.exe") && !fD)
    If (A_TimeIdleMouse>3000){
      MouseGetPos oX,oY
     ; MouseClick L,x1,y1,,0
     ; Sleep 1000
     ; MouseClick L,x2,y2,,0
     ; MouseMove oX,oY
      fD:=1
    }
  Else If fD{
    MouseGetPos nX,nY
    If (nX!=oX || nY!=oY)
      fD:=0
  }
Return

tX:
  ToolTip % "Time: " A_TimeIdleMouse
        . "`nDone: " fD
        . "`nOPos: " oX "," oY
        . "`nNPos: " nX "," nY
        ,200,500
Return