x1:=520,y1:=110,x2:=570,y2:=130,vE:="Notepad.exe"
x1:=5,y1:=62,x2:=100,y2:=75,vE:="Notepad.exe"
SetTimer tT,250

#If WinActive("ahk_exe" vE)&&(mX>=x1)&&(mX<=x2)&&(mY>=y1)&&(mY<=y2)
  $LButton::
    SendInput {LButton}\
    ClipCursor((fA:=!fA),x1,y1,x2,y2)
  Return
#If

Esc::
  ClipCursor()
  ExitApp

tT:
  MouseGetPos mX,mY
  If !WinActive("ahk_exe" vE)
    fA:=0
Return

ClipCursor(fA=False,x1=0,y1=0,x2=1,y2=1){
  WinGetPos wX,wY,,,A
  x1:=x1+wX,y1:=y1+wY,x2:=x2+wX,y2:=y2+wY
  VarSetCapacity(R,16,0)
  NumPut(x1,&R+0),NumPut(y1,&R+4)
  NumPut(x2,&R+8),NumPut(y2,&R+12)
  Return fA?DllCall("ClipCursor",UInt,&R):DllCall("ClipCursor")
}
