;The following is setting up a timer to
;display the state of our set variables
;The counter (vC) and run state (fA)...
CoordMode Mouse
CoordMode ToolTip
SetTimer tD,250
tD:
  ToolTip % "C: " vC "`nA: " fT,200,500
Return

;### Main code starts from here out ###
#IfWinActive ahk_exe notepad.exe
F1::         ;The main key for testing!
  vC:=0      ;Initialise a counter (vC)
  SetTimer tT,% (fT:=!fT)?"-1":"Off"
Return       ;^Toggle main loop on/off^
#IfWinActive ;End active Hotkey section

Esc::ExitApp ;No idea what this does...

tT:          ;Main timer loop section!!
  If WinActive("ahk_exe notepad.exe"){
    If (vC=0){       ;It's a fresh run!
      MouseMove 833,470
    }Else If (vC=9){ ;At the 9th second
      MouseMove 1236,874
      MouseMove 1317,946
      vC:=-1         ;Reset our counter
    }
    SetTimer tT,-1000 ;Restart 1s Timer
  }Else{             ;App isn't active!
    fT:=False        ;Set state as Off.
    SetTimer tT,Off  ;Set timer as Off.
    vC:=-1           ;Reset the counter
  }
  vC++               ;Increment counter
Return
