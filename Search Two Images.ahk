CoordMode, Mouse
CoordMode, Pixel
SetWorkingDir %A_ScriptDir%

Gui OSD:New,+AlwaysOnTop +ToolWindow -Caption
Gui Font,s18 cLime,Consolas
Gui Color,000000
Gui Add,Text,x4 y0 w600 h32 vTXT,Running...
Gui Show,NoActivate x20 y20 w600 h32,OSD
WinSet TransColor,000000,OSD
sx:=0,sy:=0,sw:=1920,sh:=1080

F1::
	FND:=0
	Loop 6{
		IMG:=!IMG
		If IMG
			ImageSearch x1,y1,sx,sy,sw,sh,*0 p1.png
		Else
			ImageSearch x1,y1,sx,sy,sw,sh,*0 p2.png
		If (ErrorLevel=1){
			OSD("Searching for images, attempt #" Ceil(A_Index/2))
			Sleep 1000
			FND:=0
		}Else If (ErrorLevel=2){
			OSD("File image error! Exiting...")
			Sleep 3000
			Goto Esc
		}Else{
			FND:=-1
			Break
		}
	}
	If (FND=-1)
		OSD("Found image at " x1 "," y1 "!")
	Else
		OSD("Nothing found...")
Return

Esc::
Gui	OSD:Destroy
	ExitApp

OSD(m:=""){
	GuiControl OSD:,TXT,% m
}