#SingleInstance Force
SetWorkingDir % A_ScriptDir
ARR:=[]

MButton::
  If !ARR.Count()
    Loop Read,Phrases.txt
      ARR.Push(A_LoopReadLine)
  Random RND,1,ARR.Count()
  VAR:=ARR.Remove(RND)
  Send % VAR "`n"
Return

Esc::ExitApp