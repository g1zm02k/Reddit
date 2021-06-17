#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Gui gWin:New
Gui Font,s12,Consolas
Gui Add,Text, x10 y10 w200 h16 +0x200,% "What is       % of" ;Long text box
Gui Add,Edit, x80 y08  w50 h20 gPerOf vPer1 Right            ;1st Input
Gui Add,Edit,x180 y08  w50 h20 gPerOf vPer2 Right            ;2nd Input
Gui Add,Text,x240 y10 w120 h16        +0x200 vPerA           ;Answer
Gui Show,w320 h40,gWin         ;^ ^ ^                        ;Show centred                        ; ^ ^
Return                         ; ^ ^ 
                               ;up there, look!
PerOf: ;This connects with those ^ ^                         ;Run whenever 1st or 2nd Input change
  Gui Submit,NoHide                                          ;Keep showing
  If (Per1<>"" && Per2<>"")             ;If 1st and 2nd Input have content
    GuiControl gWin:,PerA,% Round(((Per1*Per2)/100),2)       ;Do the thing
  Else                                                          ;Otherwise
    GuiControl gWin:,PerA                                ;Put a mask on it
Return

gWinGuiEscape:
gWinGuiClose:
  ExitApp