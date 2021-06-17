Gui Test:New,,Test Window Title
Gui Add,Button,gbOne,Control
Gui Add,Button,gbTwo,Click
Gui Add,Button,gbMid,These
Gui Add,Button,gbEnd,Names
Gui Show

#If WinActive("Test Window Title")
  1::ControlClick Control,Test Window Title
  2::ControlClick Click,Test Window Title
  3::ControlClick These,Test Window Title
  4::ControlClick Names,Test Window Title
#If

bOne:
  MsgBox You pressed the first button.
Return

bTwo:
  MsgBox You pressed the second button.
Return

bMid:
  MsgBox You pressed the third button.
Return

bEnd:
  MsgBox You pressed bottom button.
Return