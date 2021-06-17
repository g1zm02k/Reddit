Clipboard:="Let's try this sentence for size to see if it works..."
F1::
  Loop Parse,Clipboard
  {
    If (A_LoopField=" ")
      Random vR,100,250
    Else
      Random vR,30,70
    Sleep % vR
    SendInput % A_LoopField
  }
Return