#SingleInstance Force

Browse:=["Chrome","Firefox","Opera"]

F1::
  Match:=""
  WinGet WinExe,ProcessName,A             ;Get full browser exe name
  WinExe:=SubStr(WinExe,1,InStr(WinExe,".")-1)    ;Get name from exe
  Loop % Browse.Count()                         ;Loop through Browse
    If (WinExe=Browse[A_Index])                   ;Check name match?
      Match:=A_Index
  If Match
    MsgBox % "Match found: " WinExe " with Browse, Index " Match "!"
  Else
    MsgBox % "Browser not running or doesn't match."
Return
