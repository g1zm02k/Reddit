Alt::Tog:=!Tog
#If Tog
  ~*$RButton::
    While GetKeyState("RButton","P"){
      Send {Blind}{RButton}
      Sleep 20
    }
  Return
#If