#Persistent
CoordMode ToolTip
SetTimer tX,100

vW:=3000                                      ;Wait time in ms
F1::                                          ;Start key
  vN:=A_TickCount                             ;Get current time
  MouseGetPos oX,oY                           ;Get current mousepos
  Loop{                                       ;Loop
    MouseGetPos nX,nY                         ;Get new mousepos
    If (nX=oX && nY=oY && A_TickCount-vN>vW){ ;If mouse x&y not changed and count>time
      Send % "POIU"                           ;Do the thing
      vN:=A_TickCount                         ;Reset the timer
;      Break                                  ;or Break the loop instead
;      SetTimer tX,Off                        ;and stop the timer
    }Else If (nX!=oX || nY!=oY){              ;If the mouse moved
      oX:=nX,oY:=nY,vN:=A_TickCount           ;Reset everything
    }                                         ;End If check
  }                                           ;End Loop block
Return                                        ;End code block

tX:
  ToolTip % "T: " A_TickCount-vN "`nN: " nX "," nY "`nO: " oX "," oY ,200,500
Return