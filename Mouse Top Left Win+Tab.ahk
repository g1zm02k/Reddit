#Persistent
SetTimer tT,100
cx:=5,cy:=5
tT:
  MouseGetPos mx,my
  If (mx<cx && my<cy){
    Send #{Tab}
    Sleep 1000 ;Avoid spamming it
  }
Return