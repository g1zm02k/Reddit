#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
CoordMode Mouse
CoordMode Pixel

F8::
  Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Minecraft Launcher\Minecraft Launcher.lnk"
  Loop{
    ImageSearch vX,vY,0,0,1920,1080,*50 MC.png
    If !ErrorLevel{
			MouseClick L,vX,vY,,0
      vE:=1
    }Else If (ErrorLevel=1){
       ToolTip % "Searching..."
    }Else If (ErrorLevel=2){
      MsgBox % "Fault with image search path..."
      ExitApp
    }
  } Until vE
  ToolTip
Return
Esc::ExitApp