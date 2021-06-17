SetTimer tT,30

LControl & RAlt::Send % "{" KEY "}"

tT:
	If (A_PriorKey!="RAlt")
		KEY:=A_PriorKey
Return