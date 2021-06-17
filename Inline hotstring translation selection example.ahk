HotstringMenu(TextList)
{
  MenuItems := StrSplit(TextList, "==")
  Loop % MenuItems.MaxIndex()
    Menu, MyMenu, add, % MenuItems[A_Index], HotstringMenuAction
  Menu, MyMenu, Show, %A_CaretX%, %A_CaretY%
  Menu, MyMenu, DeleteAll
}
 
HotstringMenuAction:
  InsertText := StrSplit(A_ThisMenuItem, "|")
  TextOut := StrReplace(RTrim(InsertText[1]), "&")
  TextOut := % SubStr(A_ThisHotkey,5)~="[A-Z]"?RegExReplace(TextOut,"^[a-z]","$U0"):TextOut
  SendInput {raw}%TextOut%%A_EndChar%
Return

:xC*:Alegria\::    ;Needed to allow separate case versions!
:x*:alegria\::HotstringMenu("joy | &1==happiness| &2")

;Check 5th Char uppercase?
;TextOut := % SubStr(A_ThisHotkey,5)~="[A-Z]"?RegExReplace(TextOut,"^[a-z]","$U0"):TextOut
