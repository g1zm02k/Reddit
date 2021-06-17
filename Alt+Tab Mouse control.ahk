#Persistent
CoordMode ToolTip
SetTimer tT,100

; Ctrl+Tab (+Shift)
XButton1 & LButton::Send ^+{Tab}
XButton1 & RButton::Send ^{Tab}

;Alt+Tab (+Shift)
XButton2 & LButton::ShiftAltTab
XButton2 & RButton::AltTab

;Keep normal function on press & release
XButton1::Send {XButton1}
XButton2::Send {XButton2}

tT:
	x1:=GetKeyState("XButton1","P")
  x2:=GetKeyState("XButton2","P")
	m1:=GetKeyState("LButton","P")
	m2:=GetKeyState("RButton","P")
  ToolTip % "X1: " x1
	. "`nX2: " x2
	. "`nLB: " m1
	. "`nRB: " m2
	,100,500
Return

/*
<- Watch here to see which buttons
<-  are being pressed/held down!!



