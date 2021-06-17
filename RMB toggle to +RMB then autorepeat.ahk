dly:=200
*$RButton::
	now:=A_TickCount
	While GetKeyState("RButton","P"){
		If (A_TickCount-now>dly)
			Send RButton
		Else{
			Send % (Toggle:=!Toggle)?"{RButton}":"+{RButton}"
			Sleep % dly
		}
	}
Return