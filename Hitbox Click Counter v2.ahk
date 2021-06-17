#NoEnv
#SingleInstance Force
SetBatchLines -1
CoordMode Mouse

;### Initialise Vars ###
fHIT:=1             ;Hide Hitbox intially
oX:=10,oY:=10       ;Counter Display Pos
x1:=985,y1:=501     ;Top Left Hitbox
x2:=1057,y2:=534    ;Bottom Right Hitbox
xw:=x2-x1,yw:=y2-y1 ;Hitbox Width + Height

;### Counter Display ###
Gui OSD:New,+AlwaysOnTop +ToolWindow -Caption +E0x20
Gui Font,s18 cLime,Consolas
Gui Color,000000
Gui Add,Text,x4 y0 w56 h32 vOSD Right,% 0
Gui Show,NoActivate x%oX% y%oY% w68 h32,OSD
WinSet Transparent,150,OSD

;### Hitbox Display ###
Gui HIT:New,+AlwaysOnTop +ToolWindow -Caption +E0x20
Gui Color,99FF00
Gui Show,NoActivate x%x1% y%y1% w%xw% h%yw%,HIT
WinSet Transparent,50,HIT
Gui HIT:Hide

;### Click Code ###
~LButton::
  MouseGetPos mX,mY
  If (mX>=x1 && mX<=x2
   && mY>=y1 && mY<=y2)
    vCTR++
  GuiControl OSD:,OSD,% vCTR
Return

;### Controls ###
F1::Gui % (fOSD:=!fOSD)?"OSD:Hide":"OSD:Show",NoActivate
F2::Gui % (fHIT:=!fHIT)?"HIT:Hide":"HIT:Show",NoActivate
F3::GuiControl OSD:,OSD,% vCTR:=0