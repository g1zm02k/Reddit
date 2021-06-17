Lst=
(
BlueJeans,m
CiscoWebexStart,^m
Discord,^+m
FacebookMessenger,!m
g2mstart,^!a
googletalkplugin,!a
Signal,+m
Skype,^m
Slack,m
Teams,^+m
Zoom,!a
)

MButton::
  Winget Cur,ID,A
  Loop Parse,Lst,`n
  {
    App:=SubStr(A_LoopField,1,RegExMatch(A_LoopField,",")-1) ".exe"
    Key:=SubStr(A_LoopField,RegExMatch(A_LoopField,",")+1)
    If WinExist("ahk_exe " App){
      WinActivate % "ahk_exe " App
      SendInput % Key
    }
  }
  WinActivate ahk_id %Cur%
Return