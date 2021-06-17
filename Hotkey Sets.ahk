#MaxHotkeysPerInterval 10000
Suspend On

Loop 10{
  Hotkey % "$" A_Index-1,Hotkeys
  If (A_Index!=6)
    Hotkey % "$F" A_Index,Hotkeys
  }
  Hotkey % "$c",Hotkeys
Return

Hotkeys:
  While GetKeyState(SubStr(A_ThisHotKey,2),"P")
    Send % "{"SubStr(A_ThisHotKey,2)"}"
Return

\::Suspend