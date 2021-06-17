SetKeyDelay 0,50
p:=0
XButton1:: ;U
XButton2:: ;D
  b:=SubStr(A_ThisHotkey,-0)-1
  p:=% b?p-1:p+1
  p:=Mod(p+11,12)+1
	SD(A_ThisHotkey " F" p,0)
  Send % "{F" p "}"
Return