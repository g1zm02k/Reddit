Res:="1.35,3.04,1.30,3.20,1.35,3.05,1.30,3.07
,1.36,2.92,1.33,3.25,1.35,3.02,1.43,2.67,1.32
,3.22,1.33,3.20,1.36,3.00,1.35,3.02,1.35,3.04
,1.35,2.98,1.28,3.54,1.35,3.02,1.33,3.20"
Loop,Parse,Res,`,    ;Loop through each value
{
  tg:=!tg            ;Toggle alternate values
  If tg                          ; Odd Values
    t1.=A_LoopField "`n"         ;Store in t1
  Else                           ;Even values
    t2.=A_LoopField "`n"         ;Store in t2
}
Sort t1,R                  ;Sort (in reverse)
Sort t2,R                  ;Highest value=top
MsgBox % t1                  ;Display results
MsgBox % t2                  ;For both teams.