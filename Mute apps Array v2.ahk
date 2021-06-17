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
		Loop Parse,A_LoopField,`,
			c:=(t:=!t)+1,v%c%:=A_LoopField
		If WinExist("ahk_exe " v2 ".exe"){
      WinActivate
      SendInput % v1
    }
  }
  WinActivate ahk_id %Cur%
Return