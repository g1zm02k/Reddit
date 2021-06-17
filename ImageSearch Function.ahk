#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
CoordMode Mouse
CoordMode Pixel
Global vE,vX,vY,gX:=A_ScreenWidth/2-69,gY:=A_ScreenHeight-40,gD:=1 ;Set gD to 0 to start hidden!

Gui OSD:New,+AlwaysOnTop +ToolWindow -Caption
Gui Font,s18 cLime,Consolas
Gui Color,000000
Gui Add,Text,x0 y-2 w138 h28 vTXT Center,Waiting...
Gui Show,NoActivate x%gX% y%gY% w138 h28,OSD
WinSet Transparent,150,OSD
If !gD
  Gui OSD:Hide

;####### Examples #######
F1::IMG("SameDirImage.png")                                  ;Full screen
F2::IMG("D:\Coding\ImgSearch\FFReload.png",,550,450,750,750) ;Spec'd area/no limits.
F3::IMG("D:\Coding\ImgSearch\FFReload.png",.5,0,0,135,85)    ;Sped'd area/500ms only.
F4::                                                         ;Return value example/No Gui
  gD:=0
  Gui OSD:Hide
  vT:=IMG("D:\Coding\ImgSearch\FFReload.png",3,0,0,135,85)   
  If (vT=-1){
    MsgBox Quitting...
    ExitApp
  }Else If (vT=1){
    MsgBox I'm going to click it!
    MouseClick L,vX+10,vY+10
  }Else
    MsgBox Never found it!
Return
F5::vE:=-1                                                   ;Cancel Flag!
F6::Gui % (gD:=!gD)?"OSD:Show":"OSD:Hide",NoActivate         ;Toggle OSD on the fly!
;##### End Examples #####

Esc::ExitApp

;##### Functions #####
IMG(img,vS:=0,x1:=0,y1:=0,x2:=0,y2:=0){
  vC:=1,vE:=0,x2:=!x2?A_ScreenWidth:x2,y2:=!y2?A_ScreenHeight:y2,tN:=A_TickCount,tS:=vS*1000
  Loop{
    ImageSearch vX,vY,x1,y1,x2,y2,*50 %img%
    If !ErrorLevel{
      OSD("Found " img " at position " vX "," vY ".")
      vE:=1
      Break
    }Else If (ErrorLevel=1){
      OSD("Searching for '" img "', attempt " vC++ "...")
      If (A_TickCount-tN>tS && vS>0){
        OSD("Not found after " vS " seconds/" vC " scans (" img ").")
        Break
      }
    }Else If (ErrorLevel=2){
      OSD("Fault with Image file path for '" img "'!")
      vE:=2
      Break
    }
  } Until vE
  If (vE=-1)
    OSD("User Aborted on '" img "'.")
  Return vE
}

OSD(gT:=""){
  gT:=gT!=""?gT:"! Empty !"
  gW:=StrLen(gT)*13+8
  gX:=(A_ScreenWidth-gW)/2
  If gD
    Gui OSD:Show,NoActivate x%gX% y%gY% w%gW% h28,OSD
  Else
    Gui OSD:Hide
  GuiControl OSD:Move,TXT,x0 y-2 w%gW% h28
  GuiControl OSD:,TXT,% gT
}