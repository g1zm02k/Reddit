SetKeyDelay -1,70
SetBatchLines -1

*q::
  If !h
    SendInput % (t:=!t)?"1":"2"
  Else
    SendInput % t?"1":"2"
  h:=0
Return

~*4::h:=1