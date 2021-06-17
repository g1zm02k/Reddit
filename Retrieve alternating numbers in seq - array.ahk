Res:="1.35,3.04,1.30,3.20,1.35,3.05,1.30,3.07
,1.36,2.92,1.33,3.25,1.35,3.02,1.43,2.67,1.32
,3.22,1.33,3.20,1.36,3.00,1.35,3.02,1.35,3.04
,1.35,2.98,1.28,3.54,1.35,3.02,1.33,3.20"
at1:=[],at2:=[]            ;Initialise arrays
Loop,Parse,Res,`,          ;Loop through vals
{
  tg:=!tg                  ;Flips every value
  If tg                    ; Odd loop toggled
    at1.Push(A_LoopField)  ;Send values to t1
  Else                     ;Even loop toggled
    at2.Push(A_LoopField)  ;Send values to t2
}
mt1:=at1[1],mt2:=at2[1]    ;Get initial value
vt1:=at1[1],vt2:=at2[1]    ;Ditto list values
Loop % at1.MaxIndex()-1    ;Loop through vals
{
  If (mt1<at1[A_Index+1])  ;If first val less
    mt1:=at1[A_Index+1]    ;than next do swap
  If (mt2<at2[A_Index+1])  ;If first val less
    mt2:=at2[A_Index+1]    ;than next do swap
  vt1.="`n" at1[A_Index+1] ;team1 result list
  vt2.="`n" at2[A_Index+1] ;team2 result list
}
MsgBox % vt1               ;Show team1 result
MsgBox % vt2               ;Show team2 result
MsgBox % "T1 Max: " mt1 "`nT2 Max: " mt2 ;Max