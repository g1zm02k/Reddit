#Persistent
CoordMode ToolTip
SetTimer tX,100

#Include C:\Users\%A_UserName%\Documents\AutoHotkey\Lib\TapHoldManager.ahk

Global Disable_bcon:=0 ;This NEEDS delaring to use outside the function!

BconG6043DX:=New TapHoldManager(80,200)
BconG6043DX.Add("Esc",Func("BconG6043DX_esc"))
BconG6043DX_esc(isHold,taps,state){
  If (taps=1)
    If !isHold
      Disable_bcon:=1
    Else If state
      Disable_bcon:=0
}

#If Disable_bcon          ;This will disable LCtrl based on Disable_bcon
	LCtrl::Return
#If

tX:
  k1:=GetKeyState("LCtrl")
  ToolTip % "Dis?:  " Disable_bcon "`nLCtrl: " k1,200,500
Return