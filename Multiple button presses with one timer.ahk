t::                               ;Toggle key
  vCtr:=0                         ;Initialise counter (vCtr)
  Send 234                        ;Start initial presses
  SetTimer tTimer,% (TimerOn:=!TimerOn)?"50":"Off"
Return
tTimer:                           ;Called every 50ms
  vCtr++                          ;Increment by 1
  Send 2                          ;Send every call (50ms)
  If (Mod(vCtr,127)=0)            ;If vCtr=127 (127*50ms=6350ms)
    Send 3
  If (Mod(vCtr,100)=0)            ;If vCtr=100 (100*50ms=5000ms)
    Send 4
Return

/*
t::                       ;Toggle key
  vCtr:=0                 ;Initialise counter (vCtr)
  Send 234                ;Start initial presses
  TimerOn:=!TimerOn       ;Toggles TimerOn between 0 and 1
  If TimerOn              ;If our toggle is 'On' (TimerOn=1)
    SetTimer tTimer,50    ;  Set a timer (tTimer) every 50ms
  Else                    ;Otherwise (TimerOn NOT=1)
    SetTimer tTimer,Off   ;  Turn off the timer (tTimer)
Return                    ;End this block of code

tTimer:                   ;Our timer, which is run every 50ms
  vCtr++                  ;Increment our counter (vCtr) by 1
  Send 2                  ;Send '2' every call (50ms)
  If (Mod(vCtr,127)=0)    ;If vCtr=127 (127*50ms=6350ms)
    Send 3                ;Send '3'
  If (Mod(vCtr,100)=0)    ;If vCtr=100 (100*50ms=5000ms)
    Send 4                ;Send '4'
Return                    ;End this block of code
*/