F2::
method1(){
  A:=1
  B:=2
  C:=3
  v:=method2(A,B,C)
  MsgBox % v.A "," v.B "," v.C
}

method2(ByRef A,B,C){
  v:={}
  v.A:=A+1
  v.B:=B+2
  v.C:=C+3
  Return v
}