#Persistent
irf:="D:\Portable\IrfanViewPortable\App\IrfanView\i_view32.exe"
dir:="D:\Downloads\AHK\Pics\"
SetTimer Check,250

Check:
  ExeChk("notepad","NP.png")
  ExeChk("firefox","FF.png")
	ExeChk("photoshop","PS.png")
	ClsChk("CabinetWClass","EX.png")
	ClsChk("Progman","DT.png")
	ClsChk("Shell_TrayWnd","TB.png")
Return

ExeChk(app,img){
  global
  If (WinActive("ahk_exe " app ".exe") && !WinExist(img " - IrfanView")){
    Run % irf " " dir img
    Sleep 250
    WinActivate % "ahk_exe " app ".exe"
  }
}

ClsChk(app,img){
	global
	If (WinActive("ahk_class " app) && !WinExist(img " - IrfanView")){
		If (app="CabinetWClass")
			WinGetTitle wgt,A
    Run % irf " " dir img
    Sleep 250
		If (app="CabinetWClass")
			WinActivate % wgt
		Else
			WinActivate % "ahk_class " app
	}
}
