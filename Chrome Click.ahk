#IfWinActive ahk_class Chrome_WidgetWin_1
>+>^::
  vC:=0
  SetTimer tT,% (fT:=!fT)?"-1":"Off"
Return
#IfWinActive

Esc::ExitApp

tT:
  If WinActive("ahk_class Chrome_WidgetWin_1"){
    If (vC=0){
      Click 833,470
    }Else If (vC=9){
      Click WheelUp,3
      Click 1236,874
      Click 1317,946
      vC:=-1
    }
    SetTimer tT,-1000
  }Else{
    SetTimer tT,Off
    fT:=False
    vC:=-1
  }
  vC++
Return
