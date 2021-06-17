MsgBox % Group("B2A2A1E3D3") ;-> A AB DE (Alpha grouped by Digit)

Group(s){
  g:=[]                        ;Initialise array!
  s.=Mod(StrLen(s),2)?"0":""   ;Keep length const
  Loop % StrLen(s)/2{          ;Spilt groups of 2
    l:=SubStr(s,A_Index*2-1,1) ;Get 1st char of 2
    n:=SubStr(s,A_Index*2,1)   ;Get 2nd char of 2
    g[n].=l ","                ;Array add/sep " "
  }
  For c,v in g{                ;Split for sorting 
    Sort v,U                   ;Sort chars (-dup) 
    r.=RegExReplace(v,",") " " ;Remove all commas
  }
  Sort r                       ;Sort indiv groups
  Return % Trim(r)             ;Remove spc & done
}