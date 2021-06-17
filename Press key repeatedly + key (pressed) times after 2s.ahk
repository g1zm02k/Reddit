~1::
  vCTR++
  SetTimer tCLK,200
Return

~2::
	If !vCTR
		SetTimer tCLK,200
	vCTR++
Return

tCLK:
  Send {x %vCTR%}
  vCTR:=0
Return
