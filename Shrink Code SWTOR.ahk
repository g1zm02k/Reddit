;Initial Code
^+1::
  Send b
  Sleep 250
  MouseMove 170,700,3
  Sleep 250
  Click
  Sleep 250
  MouseMove 1800,550,3
  Sleep 250
  Click 2
  Sleep 250
  MouseMove 170,790,3
  Sleep 250
  Click
  Sleep 250
  MouseMove 1800,550,3
  Sleep 250
  Click 2
  Sleep 250
  MouseMove 170,880,3
  Sleep 250
  Click
  Sleep 250
  MouseMove 1800,550,3
  Sleep 250
  Click 2
  Sleep 250
  MouseMove 170,970,3
  Sleep 250
  Click
  Sleep 250
  MouseMove 1800,550,3
  Sleep 250
  Click 2
  Sleep 250
  MouseMove 170,810,3
  Sleep 250
  MouseClick WheelDown,170,810,3,10
  Sleep 250
  Click
  Sleep 250
  MouseMove 1800,550,3
  Sleep 250
  Click 2
  Sleep 250
  MouseMove 170,900,3
  Sleep 250
  Click
  Sleep 250
  MouseMove 1800,550,3
  Sleep 250
  Click 2
  Sleep 250
  Send {Esc}
  Send {Esc}
Return

;Final Pass
^+1::
  Send b
  Sleep 250
  YPos:=700                             ;Initial Y coordinate value
  Loop 6{                               ;Loop each Crew Member (CM)
    If (A_Index=5)                      ;Scroll panel window on CM5 
      MouseClick WD,170,YPos:=810,3,10  ;Alter YPos to match change
    MouseClick L,170,YPos,1,3           ;Move+Click current CM YPos
    Sleep 250
    MouseClick L,1800,550,2,3           ;Move+Click for convenience
    Sleep 250
    YPos+=90                            ;Increase YPos for every CM
  }
  Send {Esc 2}
Return
