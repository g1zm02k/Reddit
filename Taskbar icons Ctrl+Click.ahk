#Persistent
SetTimer t,% (f:=!f)?"50":"Off"
#If (CTB="MSTaskListWClass1")
LButton::Send ^{LButton}
#If
t:
  MouseGetPos ,,,,CTB
Return