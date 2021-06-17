#SingleInstance Force
SetWorkingDir %A_ScriptDir%
CoordMode Mouse

SCR:="
(
CoordMode Mouse          ;Set to screen-wide coords
SetTimer tMousePos,50    ;Run tMouse every 50ms

~!~                      ;Replace this line!
  a::b                   ;Use this instead of default
#If                      ;End condition block
^Esc::ExitApp            ;Ctrl+Esc quits

tMousePos:
  MouseGetPos mX,mY      ;Get mouse position
Return
)"

Gui Title:New,+AlwaysOnTop +ToolWindow +Resize -Caption
Gui Font,s9,Consolas
Gui Add,Text,x0 y0 w140 h140 vTXT,Move + Resize me!`nPress F1 when done...
Gui Show,NoActivate x900 y500 w180 h300,Title
WinSet Transparent,200,Title

F1::
  WinGetPos,WinX,WinY,WinW,WinH,Title
  REP:="#If (mX>" WinX " && mX<" WinX+WinW " && mY>" WinY " && mY<" WinY+WinH ") `;w00t!"
  SCR:=RegExReplace(SCR,"`am)^~!~.*$",REP)
  FileDelete % "MouseZone.ahk"
  FileAppend % SCR,% "MouseZone.ahk"
  ExitApp
