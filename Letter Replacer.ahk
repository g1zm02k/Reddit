F9::
	ReChr("a|â,ã e|ê,é")
Return

ReChr(Tmp){
  ClipBU:=ClipBoardAll
  Clipboard:=""
  Send ^x
  ClipWait 0.1
  Loop Parse,Tmp,% A_Space
    Clipboard:=RegExReplace(Clipboard
    ,SubStr(A_LoopField,1,InStr(A_LoopField,",")-1)
    ,SubStr(A_LoopField,InStr(A_LoopField,",")+1))
  Send ^v
  Clipboard:=ClipBU
}
