!g::SW()                             ;Already default search!
!4::SW("https://www.google.com/search?q=$"," to inr")
!b::SW("https://www.bing.com/search?q=")
!d::SW("http://duckduckgo.com/?q=")
!q::SW("https://www.quora.com/search?q=")
!w::SW("http://en.wikipedia.org/wiki/Special:Search?search=")
!y::SW("https://www.youtube.com/results?search_query=")
!n::SW(" C:\windows\notepad.exe")

SW(vA:="https://www.google.com/search?q=",vB:=""){
  If (SubStr(vA,1,1)=" ")            ;Is 1st char " "?
    Run % SubStr(vA,2)               ;  Run vA (2nd char on)
  Else{                              ;Else use web search...
    OldClipboard:=Clipboard
    Clipboard:=""
    Send ^c
    ClipWait
    Run % vA Clipboard vB
    Sleep 900
    Clipboard:=OldClipboard
  }
}