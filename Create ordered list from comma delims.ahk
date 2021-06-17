F1::
  Clipboard:=""
  Send ^c
  ClipWait
;  Clipboard:="▪ " RegExReplace(Clipboard," and | *, and | *, *","`n▪ ")
  Clipboard:="▪ " RegExReplace(RegExReplace(Trim(Clipboard)," +"," ")," and | *, and | *, *","`n▪ ")  Send ^v
Return
