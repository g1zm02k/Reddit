Media_Play_Pause::mKey("{Space}") ;Play/Pause
Media_Next::mKey("^{Right}")         ;Fwd 15s
Media_Prev::mKey("^{Left}")          ;Back 5s
^Media_Next::mKey("{Right}")            ;Next
^Media_Prev::mKey("{Left}")             ;Prev

mKey(keys){      ;Function to parse keys sent
  IfWinNotExist JW Library Sign Language
    Return                     ;!Exist > Stop
  WinActivate                       ;Activate
  Send % keys   ;Send keys passed via hotkeys
}