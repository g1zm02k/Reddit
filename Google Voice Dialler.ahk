GV("1234567890#s1")

GV(a){
  If !RegExMatch(a,"^[s\d#\*]*$"){
    MsgBox Invalid character(s) detected!
    Exit
  }
  MouseGetPos mx,my
  ox:=1265,oy:=430
  s:="123456789*0#"
  Loop Parse,a
  {
    If (A_LoopField="s")
      Sleep 2000
    Else{
      nx:=Mod(InStr(s,A_LoopField)-1,3)*80
      ny:=Floor((InStr(s,A_LoopField)-1)/3)
      ny:=ny=1?90:ny=2?190:ny=3?260:0
      MouseClick Left,nx+ox,ny+oy
      Sleep 350
    }
  }
  MouseMove mx,my
}