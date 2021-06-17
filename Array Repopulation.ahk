#SingleInstance Force

MButton::
  If !ARR.Count()
    ARR:=["1","2","3","4","5"]
  Random RND,1,ARR.Count()
  VAR:=ARR.Remove(RND)
  Send % VAR
Return

Esc::ExitApp