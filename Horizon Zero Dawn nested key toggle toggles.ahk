#UseHook
SendMode Input
Run E:\Games\Horizon Zero Dawn\HorizonZeroDawn.exe
WinWait ahk_exe HorizonZeroDawn.exe
Process Priority,HorizonZeroDawn.exe,High
SetTimer pWatch,100

#IfWinActive ahk_exe HorizonZeroDawn.exe
  LAlt::Send % (fTab:=!fTab)?"{Tab Down}":"{Tab Up}"
  WheelUp::Send % GetKeyState("Tab")?"z":"{WheelUp}"
  WheelDown::Send % GetKeyState("Tab")?"x":"{WheelDown}"
#IfWinActive

pWatch:
  If !WinExist("ahk_exe HorizonZeroDawn.exe"){
    Send {Tab Up}
    ExitApp
  }
Return