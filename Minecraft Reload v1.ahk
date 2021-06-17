SetKeyDelay 80
h::SKeys("ETTRTRTTTTTRTRTTTRTRRRTTTTTR")

SKeys(s){
  Loop Parse,s
  {
    k:=A_LoopField
    If (k="E")
      SendInput Esc`n
    Else If (k="T")
      SendInput Tab`n
    Else If (k="R")
      SendInput Enter`n
  }
}