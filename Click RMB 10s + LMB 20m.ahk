SetTimer tT,10000  ;Make 'tT:' run every 10s
Return             ;Done here...

tT:                ;This will run every 10s!
  vC++             ;Add 1 to vC
  If vC<120        ;If vC is less than 120
    Send {RButton} ;  Click RMB
  Else{            ;Otherwise (hit 20m!)
    Send {LButton} ;  Click LMB
    vC:=0          ;Reset counter (vC)
  }
Return             ;Done here too...

^Esc::ExitApp      ;Ctrl+Escape to quit