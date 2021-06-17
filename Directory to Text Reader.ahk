#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Left Column
Gui, Add, Text,, Directories with information
Gui, Add, ListBox, vDirectories gDirectories w300 r10
Gui, Add, Button, Default, Copy

; Middle Column
Gui, Add, Text, ym, This Directory's Content
Gui, Add, ListBox, vPath gFiles w300 r20

; Right Column
Gui, Add, Text, ym, Content of Selected File
Gui, Add, Edit, r20 vContent w600

Loop, Files, D:\Downloads\Demo\*, DR
{
  GuiControl,, Directories, %A_LoopFileName%
  GuiControlGet, Directories
}
Gui, Show
Directories:
if (A_GuiEvent != "Normal")
  return

Guicontrol,, Path, |
GuiControlGet, Directories
TmpList:=""                                            ;<-- Create Temp list of files
Loop, Files, D:\Downloads\Demo\%Directories%\*.*, FR
{
  TmpList.=A_LoopFileName "::" A_LoopFileFullPath "`n" ;<-- Add BOTH Name & Full Path
  GuiControl,, Path, %A_LoopFileName%
  GuiControlGet, Path
}
return

Files:
if (A_GuiEvent != "Normal")
  return

GuiControlGet, Path
RegExMatch(TmpList,Path "::(.*?)`n",TmpPath)           ;<-- Match Full Path to Name +
FileRead, Content, %TmpPath1%                          ;<-- Read Full Path instead...
GuiControl,, Content, %Content%
return

GuiClose:
GuiEscape:
  ExitApp