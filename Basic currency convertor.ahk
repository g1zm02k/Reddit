^Space::
  InputBox runInput,Searcher  ;Format "x|c $$$"
  RegExMatch(runInput,"[\w]+",searchMod)
  searchTerm:=SubStr(runInput,StrLen(searchMod)+1)
  searchTerm:=trim(searchTerm)
  if (searchMod="x") {
    v:=web("https://usd.currencyrate.today/cad/" searchTerm)
    RegExMatch(v,"\$[^\$]*+\$(\d*+)\.\d\d",res)
    MsgBox % res1
  } else if (searchMod="c") {
    v:=web("https://cad.currencyrate.today/usd/" searchTerm)
    RegExMatch(v,"\$[^\$]*+\$(\d*+)\.\d\d",res)
    MsgBox % res1
  } else
    MsgBox Invalid search terms
Return

web(url){
  whr:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
  whr.Open("GET",url,true)
  whr.Send()
  whr.WaitForResponse()
  v:=whr.ResponseText
  Return v
}