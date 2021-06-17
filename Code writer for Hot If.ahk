#SingleInstance Force
If !A_IsAdmin
  Run *RunAs "%A_ScriptFullPath%"
MsgBox After clicking 'OK', run the tab you want to track and press 'F1'

F1::
  WinGetTitle wT,A
  WinGet wE,ProcessName,A
  vTMP:="#SingleInstance Force`n`n"
      . "#IfWinActive " wT " ahk_exe " wE "`n"
      . "  w::Up`n  a::Left`n  s::Down`n  d::Right`n#If`n`n"
      . "Esc::ExitApp"
  FileDelete % "Subway Surfers.ahk"
  FileAppend % vTMP,% A_ScriptDir "\Subway Surfers.ahk"
  MsgBox % "Copied:`n`n" vTMP "`n`nto Subway Surfers.ahk"
ExitApp