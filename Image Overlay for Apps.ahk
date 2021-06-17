#Persistent
irf:="D:\Portable\IrfanViewPortable\App\IrfanView\i_view32.exe"
dir:="D:\Pictures\"
SetTimer Check,500

Check:
  ac("notepad","6.png")
	ac("notepad++","7.jpg")
Return

ac(app,img){
	global
	If (WinActive("ahk_exe " app ".exe") && !WinExist(img " - IrfanView")){
		Run % irf " " dir img
		Sleep 200
		WinActivate % "ahk_exe " app ".exe"
	}
}
