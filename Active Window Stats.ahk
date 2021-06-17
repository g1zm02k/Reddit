F1::
  WinGetTitle wT,A
  WinGetClass wC,A
  WinGet wE,ProcessName,A
  MouseGetPos mX,mY
  Clipboard:=wT "`nahk_class " wC "`nahk_exe " wE "`n" mX "," mY
	MsgBox % Clipboard
Return

F2::
	If !WinActive("ahk_exe Photoshop.exe"){
		WinActivate ahk_exe Photoshop.exe
		Sleep 200
	}
	Send +^s								;Save As...
	WinWaitActive Save As
	Sleep 200               ;Let it fully load
	MouseClick L,789,620,,0 ;Click on Save
	;And so on...
Return