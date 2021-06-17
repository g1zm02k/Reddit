MButton::
  fAct:=!fAct
  SetTimer tRmb,Off
Return

#If fAct
~$LButton::
  fTog:=!fTog
  If fTog{
    Send {LButton Down}
    SetTimer tRmb,-1
  }Else{
    SetTimer tRmb,Off
    Send {LButton}
  }
Return
#If

tRmb:
  Click Right
  SetTimer tRmb,-3000
Return
