#InstallKeybdHook
#InstallMouseHook

SetTimer tChk,100
vIdl:=5000,fRun:=0

tChk:
	If (A_TimeIdlePhysical>vIdl && !fRun){
		Run cmd.exe
		fRun:=1,vNow:=A_TimeIdlePhysical
	}Else If (vNow>A_TimeIdlePhysical && fRun){
		WinClose ahk_exe cmd.exe
		fRun:=0
	}
Return
