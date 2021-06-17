#Persistent
#SingleInstance Force
CoordMode ToolTip
ACT:="ThFrSa"
URL:="https://www.attheraces.com/tips/atr-tipsters/simon-rowlands"
TMS:=1000*60*5                                    ;5min timer setting
ToolTip Initialising...,10,A_ScreenHeight-50      ;Show we're running
OLD:=Get(URL)                                     ;Grab initial page.
ToolTip                                           ;Hide when finished
SetTimer TMR,-1                                   ;Run initial timer.
Return

TMR:
  If RegExMatch(ACT,SubStr(A_DDDD,1,2))           ;Is today in ACT???
    If (A_Hour>13 and A_Hour<21){                 ;Are we in set time
      ToolTip Getting URL...,10,A_ScreenHeight-50 ;Starting main loop
      NEW:=Get(URL)                               ;Grab current page.
      ToolTip % "Last Check: " A_Hour ":" A_Min,10,A_ScreenHeight-50
      If (NEW=!OLD){                              ;Are they the same?
        Loop 3{
          SoundBeep 880,300                       ;Make annoying din!
          Sleep 100                               ;It won't ever end!
        }
      MsgBox,4,Page Updated!,Open the page?       ;!!!PAGE CHANGED!!!
      IfMsgBox Yes
        Run % URL
      }
    }
  OLD:=NEW                                        ;Update old setting
  SetTimer TMR,-%TMS%                             ;Reset timer proper
Return                                            ;End timer section.

Get(URL){
  URLDownloadToFile % URL,% A_Temp "\htm.txt"     ;DL latest web page
  FileRead HTM,% A_Temp "\htm.txt"                ;Import newest page
  FileDelete % A_Temp "\htm.txt"                  ;Delete newest page
  RegExMatch(HTM,"<p><em>([^>]*?)</em>",CH)       ;Get Published info
  Return CH1                                      ;Send the info back
}