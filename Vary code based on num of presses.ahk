+F1::
  vCTR++
  SetTimer tCHK,-300 ;Adjust this to alter delay between presses!
Return

tCHK:
  If (vCTR=1){
    Send ^e
    Send {Enter 2}
  }Else{
    Send ^e
    Send {Enter}
    Send {Down 5}
    Send {Tab 2}
    Send {Space}
    Send {Tab}
    Send Password
    Send {Tab}
    Send {Up 2}
    Send {Tab}
    Send {Up 4}
    Send {Tab}
    Send {Space}
    Send {Enter}
    Send Password
    Send {Enter}
  }
  vCTR:=0
Return