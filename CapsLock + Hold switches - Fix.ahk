#NoEnv
#SingleInstance force
CoordMode ToolTip
SendMode Input
k_list:="Escape,AppsKey,LWin"

dBUG:=1,nBUG:=oBUG:=""             ;#### Debug 1/2 ####
If dBUG{                   ;Only run debug code if True
  SetTimer tBUG,100
  Gui BUG:New,+AlwaysOnTop +ToolWindow ;-Caption +E0x20
  Gui Font,s9,Consolas                 ;^Now draggable!
  Gui Add,Text,x4 y0 w200 h100 vTXT
  Gui Show,NoActivate x100 y800 w200 h100,BUG
  WinSet Transparent,200,BUG
}                                  ;#### DeEnd 1/2 ####

!j::MsgBox Yep!                    ;AppsKey check
F1::ExitApp                        ;Quit quickly

$Escape::
$AppsKey::
  THK:=SubStr(A_ThisHotkey,2)
  Keywait % THK,T0.5
  If Errorlevel{
    msg:="LONG-KP: "
    If (THK="AppsKey"){
      Send !j
    }Else If (THK="Escape"){
      Run notepad.exe
    }
  }Else{
    msg:="NORMAL-KP: "
    If InStr(k_list,THK){
      msg.="`nListed "
      Send % "{" THK "}"
    }Else{
      Send % THK
    }
  }
  KeyWait % THK
  ToolTip % msg THK,7,997
  SetTimer TTip,-2000
Return

$CapsLock::
  THK:=SubStr(A_ThisHotkey,2)
  state:=GetKeyState("CapsLock","T")
  pre:=state?"Dea":"A"
  dis:=state?"ON":"OFF"
  KeyWait CapsLock,T0.4
  If ErrorLevel{
    SetCapsLockState % !state
    ToolTip % THK ":`t"  dis "`nHold to:`t" pre "ctivate",7,997
    SetTimer TTip,-3000
  }Else{
    KeyWait CapsLock,D T0.1
    If ErrorLevel{
      key:="{Esc}"
      multi:=key "`n1x "
      Send % key
      ; add actions here
    }Else{
      cmd:="ms-actioncenter:"
      multi:=cmd "`n2x "
      ; Run ms-actioncenter:
      Run % cmd
      ; add actions here
    }
    ToolTip % multi A_ThisHotkey ":`t" dis "`nHold to:`t" pre "ctivate",7,997
    SetTimer TTip,-3000
    KeyWait CapsLock
  }
Return

TTip(){
  ToolTip
  TrayTip
  SplashTextOff
  Progress Off
}

tBUG:                              ;#### Debug 2/2 ####
  pCL:=GetKeyState("CapsLock","P")
  tCL:=GetKeyState("CapsLock","T")
  kALT:=GetKeyState("Alt")
  nBUG:="Debug Active..."
  nBUG.="`nHotkey: " A_ThisHotkey "/" THK
  nBUG.="`nCLock:  p" pCL "/t" tCL
  nBUG.="`nState:  " state
  nBUG.="`nPre:    " pre
  nBUG.="`nDis:    " dis
  nBUG.="`nAlt:    " kALT
  If (nBUG!=oBUG){
    GuiControl BUG:,TXT,% nBUG
    oBUG:=nBUG
  }
Return                             ;#### DeEnd 2/2 ####