#SingleInstance Force
CoordMode Mouse
SetWorkingDir %A_ScriptDir%

vS:="
(
CoordMode Mouse

^!s::
  Sleep 500
  Send {LWin}
  Sleep 500
  ~!~
  Sleep 500
  Send {Down 3}{Space}
Return
)"

F1::
  CoordMode Mouse
  MouseGetPos mX,mY
  vS:=RegExReplace(vS,"~!~","MouseClick L," mX "," mY)
  FileDelete % "ChangeUser.ahk"
  FileAppend % vS,% "ChangeUser.ahk"
  MsgBox % "New Script created."
  ExitApp
Return