Suspend On                             ;Start disabled (use F1)

Loop 26{
  Hotkey,% "$"Chr(A_Index+96),Hotkeys  ;lowercase
  Hotkey,% "$+"Chr(A_Index+96),Hotkeys ;UPPERCASE
}
Return

Hotkeys:
  Send % SubStr(A_ThisHotKey,2) " "    ;Send pressed key+space
Return

F1::Suspend                            ;Turn on/off