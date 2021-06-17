;Initial code
F8::
    MouseGetPos, OldX, OldY
    GoogleVoice("1")
    GoogleVoice("2")
    GoogleVoice("3")
    GoogleVoice("4")
    GoogleVoice("5")
    GoogleVoice("6")
    GoogleVoice("7")
    GoogleVoice("8")
    GoogleVoice("9")
    GoogleVoice("0")
    GoogleVoice("#")
    Sleep 2000
    GoogleVoice("1")
    MouseMove, %OldX%, %OldY%
return

GoogleVoice(button) {
    ; Get coordinates of the "1" button
    x := 1265
    y := 430
    sleep 250
    if (button = "1") {
        MouseClick left, x, y
    }
    else if (button = "2") {
        MouseClick left, x+80, y
    }
    else if (button = "3") {
        MouseClick left, x+160, y
    }
    else if (button = "4") {
        MouseClick left, x, y+90
    }
    else if (button = "5") {
        MouseClick left, x+80, y+90
    }
    else if (button = "6") {
        MouseClick left, x+160, y+90
    }
    else if (button = "7") {
        MouseClick left, x, y+190
    }
    else if (button = "8") {
        MouseClick left, x+80, y+190
    }
    else if (button = "9") {
        MouseClick left, x+160, y+190
    }
    else if (button = "*") {
        MouseClick left, x, y+260
    }
    else if (button = "0") {
        MouseClick left, x+80, y+260
    }
    else if (button = "#") {
        MouseClick left, x+160, y+260
        }
    else {
        TrayTip No phone button was provided!,Did you make sure to wrap quotes around it?
    exit
    }
    sleep 250
}

;Final pass
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