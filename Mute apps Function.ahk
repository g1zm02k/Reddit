MButton::
  Mute("BlueJeans","m")          ; Blue Jeans
  Mute("Discord","^+m")          ; Discord
  Mute("FacebookMessenger","!m") ; Facebook Messenger
  Mute("googletalkplugin","!a")  ; Google Hangouts
  Mute("g2mstart","^!a")         ; Goto Meeting
  Mute("Signal","+m")            ; Signal
  Mute("Skype","^m")             ; Skype
  Mute("Slack","m")              ; Slack
  Mute("Teams","^+m")            ; Teams
  Mute("CiscoWebexStart","^m")   ; Webex
  Mute("Zoom","!a")              ; Zoom
Return

Mute(exe,key){
  Winget Cur,ID,A
  If WinExist("ahk_exe " exe ".exe"){
    WinActivate % "ahk_exe " exe ".exe"
    SendInput % key
  }
  WinActivate % "ahk_id " Cur
}