#SingleInstance Force
  cC:=000000, cT:=20             ;Custom/Trans Colour
  eD:=100                        ;E Distance
  oW:=A_ScreenWidth,  iW:=oW-eD  ;Outer/Inner Width
  oH:=A_ScreenHeight, iH:=oH-eD  ;Outer/Inner Height
  Gui M:New,+LastFound +AlwaysOnTop -Caption +ToolWindow +Ex20,M  ;Append Clickthrough
  Gui Color, %cC%
  Gui Font, s32 ; Set a large font size (32-point).
  Gui Add, Text, vMyText cGreen, FOCUS
  WinSet TransColor, %cC%
  Gui Show, x650 y500 NoActivate
  Gui E:New, +LastFound -DPIScale +AlwaysOnTop -Caption +ToolWindow +E0x20,E  ;Append Clickthrough
  Gui Color, 0xFF0000
  WinSet Transparent,% cT
  WinSet Region, 0-0 %oW%-0 %oW%-%oH% 0-%oH% 0-0 %eD%-%eD% %iW%-%eD% %iW%-%iH% %eD%-%iH% %eD%-%eD%
Return

!e::
  vC:=0
  Gui M:Font, cGreen
  GuiControl M:Font, MyText
  SetTimer UpdateOSD, 1000
	Gui E:Hide
UpdateOSD:
  vC++
  vT:=30-vC
	GuiControl M:, MyText, %vT%
  If (vT=0){
    SetTimer UpdateOSD, Off
    vT:="FOCUS"
    Gui M:Font, cRed
    GuiControl M:Font, MyText
		GuiControl M:, MyText, %vT%
    While (vT="FOCUS"){           ;Flashing!
      t:=!t
      If t{
        Gui E:Show, x0 y0 w%oW% h%oH% NoActivate
				Gui M:Show, NoActivate
      }Else{
        Gui E:Hide
				Gui M:Hide
      }
      Sleep 2000
    }
  }
Return

WheelUp::Reload