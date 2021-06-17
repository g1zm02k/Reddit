SendMode Input
CoordMode ToolTip

F6::
  ToolTip % "Morse: "((mTog:=!mTog)?"On":"Off"),10,A_ScreenHeight-30
  SetTimer tOff,-2000
Return

#If mTog
:?*:a::.-{Space}
:?*:b::-...{Space}
:?*:c::-.-.{Space}
:?*:d::-..{Space}
:?*:e::.{Space}
:?*:f::..-.{Space}
:?*:g::--.{Space}
:?*:h::....{Space}
:?*:i::..{Space}
:?*:j::.---{Space}
:?*:k::-.-{Space}
:?*:l::.-..{Space}
:?*:m::--{Space}
:?*:n::-.{Space}
:?*:o::---{Space}
:?*:p::.--.{Space}
:?*:q::--.-{Space}
:?*:r::.-.{Space}
:?*:s::...{Space}
:?*:t::-{Space}
:?*:u::..-{Space}
:?*:v::...-{Space}
:?*:w::.--{Space}
:?*:x::-..-{Space}
:?*:y::-.--{Space}
:?*:z::--..{Space}
:?*:1::.---{Space}
:?*:2::..---{Space}
:?*:3::...--{Space}
:?*:4::....-{Space}
:?*:5::.....{Space}
:?*:6::-....{Space}
:?*:7::--...{Space}
:?*:8::---..{Space}
:?*:9::----.{Space}
:?*:0::-----{Space}
:?*: ::{Backspace}/
#If

tOff:
  ToolTip
Return