Loop 10
  Hotkey % "Numpad" A_Index-1,Hotkeys ;NP0-9
Return

Hotkeys:
  Send % "#{"SubStr(A_ThisHotKey,7)"}"
Return
