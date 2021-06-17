profile:=1

#If WinActive("ahk_exe notepad.exe")
  F1::MsgBox Notepad, motherfluffers!

#If WinActive("ahk_exe notepad.exe") and (profile=1) ;En
  ::/o::The quick brown fox jumps over the lazy dog
  ::/p::This is text is in English

#If WinActive("ahk_exe notepad.exe") and (profile=2) ;Fr
  ::/o::Portez ce vieux whisky au juge blond qui fume
  ::/p::This isn't in French

#If WinActive