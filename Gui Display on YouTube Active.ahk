#NoEnv
#Persistent
#SingleInstance Force
SetTitleMatchMode 2
SetBatchLines -1

;### Gui Bumpf ###
pX:=A_ScreenWidth/2-94,pY:=A_ScreenHeight/2-16
Gui OSD:New,+AlwaysOnTop +ToolWindow
Gui Font,s18,Consolas
Gui Add,Text,x4 y0 w180 h32 vOSD Center,YT Active!
Gui Show,NoActivate x%pX% y%pY% w188 h32,OSD
YTGuiVis:=1                                        ;Set As Showing

;### Main Code ###
SetTimer tCheckYT,100

tCheckYT:
  If (WinActive("- YouTube") || WinActive("OSD")){ ;YouTube/Gui Active
    If !YTGuiVis{                                  ;If No Gui...
      Gui OSD:Show,NoActivate                      ;Show Gui!
      YTGuiVis:=1                                  ;Var=Gui Showing
    }
  }
  Else If !WinActive("- YouTube"){                 ;YouTube Inactive
    If YTGuiVis{                                   ;Gui Showing...
      Gui OSD:Hide                                 ;Hide it!
      YTGuiVis:=0                                  ;Var=Gui Hidden
    }
  }
Return
