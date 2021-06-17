#MaxThreadsPerHotkey 2
SetBatchLines -1

*F1::
  t:=!t
  Loop{
    If !t
      Break
    c++
    c:=(c=5)?1:c
    Send {Shift down}
    Send % "{" SubStr("wdsa",c,1) " Down}"
    Sleep 3000
    Send % "{" SubStr("wdsa",c,1) " Up}"
    Send {Shift up}
    Sleep 100
  }
  Send {Shift Up}
Return

*F3::
  Send {Shift Up}
  ExitApp
