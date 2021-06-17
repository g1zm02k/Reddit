$AppsKey::
  vCTR++
  SetTimer tCHK,-250 ;Adjust delay!
Return

tCHK:
  If (vCTR=1){      ;Single tap.
    If (A_ThisHotkey="$AppsKey")
      SendInput {AppsKey}

  }  ;Add more above this line...
  If (vCTR=2){      ;Double Tap
    If (A_ThisHotkey="$AppsKey"){
      Run % "C:\Users\" A_UserName "\Desktop\PROJECT SHORTCUTS"
      WinWaitActive PROJECT SHORTCUTS
  	  SendInput {LWin down}{Left}{LWin up}
      Run % "C:\Users\" A_UserName "\Desktop\SHORTCUTS"
      WinWaitActive SHORTCUTS
      SendInput {LWin down}{Right}{LWin up}
		}

  }  ;Add more above this line...
  vCTR:=0  ;Reset counter once done.
Return
