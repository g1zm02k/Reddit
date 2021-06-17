F1::
  vSUM:=0
  Clipboard:=""
  Send ^c
  ClipWait
  Loop Parse,Clipboard,`n,`r
  {
    vLIN:=A_Index
    vSUM+=RegExReplace(Trim(A_LoopField),"\w |,")
  }
  ToolTip % "Length: " StrLen(Clipboard) 
  . "`nLines: " vLIN "`nTotal: " vSUM
  . "`nAverage: " Format("{:0.2f}",vSUM/vLIN)
  Sleep 5000
  ToolTip
Return

;Explanation...
;F1::
;  vSUM:=0,Clipboard:=""                       ;Clear vSUM & CLipboard!
;  Send ^c                                     ;Copy the selected text!
;  ClipWait                                    ;Wait 'til Clipboard!=""
;  Loop Parse,Clipboard,`n,`r                  ;Parse ALL Return types!
;  {
;    vLIN:=A_Index                             ;Current Loop Line Count
;    vTMP:=Trim(A_LoopField)                   ;Remove Start/End Spaces 
;    vSUM+=RegExReplace(vTMP,"\w |,")          ;Remove Letters & Commas
;  }
;  ToolTip % "Length: " StrLen(Clipboard)      ;Display string length +
;  . "`nLines: " vLIN                          ;Total number of lines +
;  . "`nTotal: " vSUM                          ;Full total of numbers +
;  . "`nAverage: " Format("{:0.2f}",vSUM/vLIN) ;Fix Average to 2dec.pl.
;  Sleep 5000                                  ;Pause for 5 Earth secs.
;  ToolTip                                     ;Hide that there ToolTip
;Return                                        ;Something Wonderful!!!!