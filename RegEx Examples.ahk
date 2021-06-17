StringToReplace := "I am an apple"
ReplacedString := RegExReplace(StringToReplace, "a")
Msgbox, Old String = %StringToReplace% `r`nString after replace = %ReplacedString%
; Old String StringToReplace = "I am an apple", String after replace ReplacedString = "I m n pple"

OrderNumber := "00011401a"
ReplacedString := RegExReplace(OrderNumber, "0",,, 3)
Msgbox, Order Number is = %ReplacedString%
;result of ReplacedString will be "11401a"

StringCaseSense, On
StringToReplace := "I sleep EEEZZZEEE"
ReplacedString := RegExReplace(StringToReplace,"E","Z")
Msgbox, Replaced String = %ReplacedString%
;result will be "I sleep ZZZZZZZZZ"



StringToReplace := "I am an apple"
ReplacedString := RegExReplace(StringToReplace, "(.* .*) (.)(.) (.*)","$U2$3 $4 $1")
Msgbox, Old String = %StringToReplace% `r`nString after replace = %ReplacedString%
; Old String StringToReplace = "I am an apple", String after replace ReplacedString = "An apple I am"



StringToReplace := "I am an apple"
ReplacedString := RegExReplace(StringToReplace, "(^.) .* .(.) (.(.).*(.))$","$U4$L1$2$5$3")
Msgbox, Old String = %StringToReplace% `r`nString after replace = %ReplacedString%
; Old String StringToReplace = "I am an apple", String after replace ReplacedString = "Pineapple"
