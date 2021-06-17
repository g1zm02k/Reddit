#NoEnv
#SingleInstance Force
SetBatchLines -1
CoordMode ToolTip
CoordMode Mouse

~LButton::
  MouseGetPos mX,mY
  If (mX>=985 && mX<=1057
   && mY>=501 && mY<=534)
    vCTR++
  ToolTip % vCTR,10,A_ScreenHeight-30
  SetTimer Timer,-1000
Return

F1::vCTR:=0

Timer:
  ToolTip
Return
