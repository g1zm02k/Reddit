#SingleInstance Force
CoordMode Mouse
MMBDelay:=350
MonDims:=[],MonCurr:=1

dBUG:=1,nBUG:=oBUG:=""                 ;#### Debug 1/2 ####
If dBUG{
  SetTimer tBUG,100
  Gui BUG:New,+AlwaysOnTop +ToolWindow -Caption +E0x20
  Gui Font,s9,Consolas
  Gui Add,Text,x4 y0 w110 h100 vMSG
  Gui Show,NoActivate x900 y500 w110 h100,BUG
  WinSet Transparent,200,BUG
}                                      ;##### End 1/2 #####

MButton::NOW:=A_TickCount
MButton Up::
  If (A_TickCount-NOW>MMBDelay)
    Send {MButton}
  Else{
    SysGet MonCount,MonitorCount
    MouseGetPos mX,mY
    Loop %MonCount%{
      SysGet a,Monitor,% A_Index
      MonDims[A_Index]:=[aLeft,aRight-aLeft,aBottom]
      If (mX>aLeft && mX<aRight)
        MonCurr:=A_Index
    }
    MonCurr:=% (MonCurr=MonCount)?1:MonCurr+1
    DllCall("SetCursorPos",int,MonDims[MonCurr][1]+(MonDims[MonCurr][2]/2),int,MonDims[MonCurr][3]/2)
  }
Return

tBUG:                                  ;#### Debug 2/2 ####
  pMMB:=GetKeyState("MButton","P")
  lMMB:=GetKeyState("MButton")
  nBUG:="Debug Active..."
  nBUG.="`nCount:   " MonCount
  nBUG.="`nCurrent: " MonCurr
  nBUG.="`nMMB P/L: " pMMB "/" lMMB
  If (pMMB || lMMB)
    nBUG.="`nD-Time:  " A_TickCount-NOW
  Else
    nBUG.="`nD-Time:  0"
  nBUG.="`n..."
  nBUG.="`n..."
  If (nBUG!=oBUG){
    GuiControl BUG:,MSG,% nBUG
    oBUG:=nBUG
  }
Return                                 ;##### End 2/2 #####
