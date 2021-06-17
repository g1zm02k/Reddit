;Initial Code
#MaxThreadsPerHotkey 2
x=1250
MButton::
Toggle := !Toggle
loop
{
	If not Toggle
		break
	if (A_Index<13){
	MouseClick,, x+A_Index*51, 600,, 0.1
	send,{enter}
	send,/destroy
	send,{enter}
	sleep 200
	}
	if (A_Index>13 and A_Index<25){
	MouseClick,, x+(A_Index-12)*51, 660,, 0.1
	send,{enter}
	send,/destroy
	send,{enter}
	sleep 200
	}
	if (A_Index>25 and A_Index<37){
	MouseClick,, x+(A_Index-24)*51, 720,, 0.1
	send,{enter}
	send,/destroy
	send,{enter}
	sleep 200
	}
	if (A_Index>37 and A_Index<49){
	MouseClick,, x+(A_Index-36)*51, 770,, 0.1
	send,{enter}
	send,/destroy
	send,{enter}
	sleep 200
	}
	if (A_Index>49 and A_Index<61){
	MouseClick,, x+(A_Index-48)*51, 820,, 0.1
	send,{enter}
	send,/destroy
	send,{enter}
	sleep 200
	}
}

;First Pass
#MaxThreadsPerHotkey 2
MButton::
Toggle:=!Toggle
loop
{
  If not Toggle
    break
  if (A_Index<13)
    MC(0,600)
  if (A_Index>13 and A_Index<25)
    MC(12,660)
  if (A_Index>25 and A_Index<37)
    MC(24,720)
  if (A_Index>37 and A_Index<49)
    MC(36,770)
  if (A_Index>49 and A_Index<61)
    MC(48,820)
}
Return
MC(x,y){
  MouseClick,,1250+(A_Index-x)*51,y,,0.1
  Send {enter}/destroy{enter}
  Sleep 200
}

;Second/Final Pass
#MaxThreadsPerHotkey 2
MButton::
Toggle:=!Toggle
loop 60
{
  If not Toggle
    break
  x:=Mod((A_Index-1),12)+1
  y:=Ceil(A_Index/12)
  MouseClick,,1234+x*52.6,557+y*53,,0.1
  Send {enter}/destroy{enter}
  Sleep 200
}
Return