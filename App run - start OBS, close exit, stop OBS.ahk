#Persistent
vRSE:="RainbowSix.exe"
SetTimer tT,250
tT:
	If (WinExist("ahk_exe " vRSE) && !fRUN){
		Send ^+{F1}
		fRUN:=True
	}
	If (!WinExist("ahk_exe " vRSE) && fRUN){
		Send ^+{F2}
		fRUN:=False
	}
Return