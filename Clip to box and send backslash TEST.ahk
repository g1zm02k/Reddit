CoordMode ToolTip                                     ;Screen-wide Tooltips
SetTimer tT,250                                       ;Start timer at 250ms
;x1:=520,y1:=110,x2:=570,y2:=130,vE:="Notepad.exe"    ;Actual values needed
x1:=5,y1:=62,x2:=100,y2:=75,vE:="Notepad.exe"         ;Dummy values to test

#If WinActive("ahk_exe" vE)&&(mX>=x1)&&(mX<=x2)&&(mY>=y1)&&(mY<=y2)  ;Trap!
  $LButton::                                          ;LMB don't fire self!
    SendInput {LButton}\                              ;Allow to select pos!
    ClipCursor((fA:=!fA),x1,y1,x2,y2)                 ;Toggle mouse clipper
  Return
#If                                                   ;Disable Hotkey block

F1::CHK(x1,y1,x2,y2)                                  ;Display testing zone
F2::Gui Box:Destroy                                   ;Turn off tester zone
F3::ClipCursor(1,x1,y1,x2,y2)                         ;Test clip to current
F4::ClipCursor()                                      ;Turn off all clipped

tT:                                                   ;Timer to get mousexy
  MouseGetPos mX,mY                                   ;Grab pos for LMB chk
  If !WinActive("ahk_exe" vE)                         ;Check for Alt+Tab to
    fA:=0                                             ;  enable safe reset!
  ToolTip % "X:" mX "`nY:" mY "`nA:" fA,200,500       ;Current variable ref
Return

ClipCursor(fA=False,x1=0,y1=0,x2=1,y2=1){             ;ClipCursor function!
  WinGetPos wX,wY,,,A                                 ;Get current Win info
  x1:=x1+wX,y1:=y1+wY,x2:=x2+wX,y2:=y2+wY             ;Calc trapping coords
  VarSetCapacity(R,16,0)                              ;Assign set var range
  NumPut(x1,&R+0),NumPut(y1,&R+4)                     ;Fill with req values
  NumPut(x2,&R+8),NumPut(y2,&R+12)                    ;Fill with req values
  Return fA?DllCall("ClipCursor",UInt,&R):DllCall("ClipCursor")  ;Call DLL!
}

CHK(x1,y1,x2,y2){                                     ;Clipping pos checker
  WinGetPos wX,wY,,,A                                 ;Get current Win info
  x1:=x1+wX,y1:=y1+wY,x2:=x2+wX-x1,y2:=y2+wY-y1       ;Calc position coords
  Gui Box:+ToolWindow -Caption +AlwaysOnTop           ;Create blank Gui box
  Gui Box:Color,99FF00                                ;Make it unmistakable
  Gui Box:Show,NoActivate x%x1% y%y1% w%x2% h%y2%,Box ;Show Gui in position
  WinSet Transparent,100,Box                          ;Make it see-through!
}