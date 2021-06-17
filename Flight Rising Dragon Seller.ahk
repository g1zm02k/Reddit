#SingleInstance Force
SetWorkingDir D:\Downloads ;%A_ScriptDir%
FLG:=0
Loop{
  InputBox DID, Dragon Info Grabber,Please enter the Dragon ID number: ; e.g. 44314857
  If ErrorLevel{
    ExitApp
  }Else{
    If !RegExMatch(DID,"^[0-9]+$") {
      MsgBox Please enter digits only.
    }Else{
      URL:="https://www1.flightrising.com/dragon/" DID
      HTM:=GrabPage(URL)
      If !RegExMatch(HTM,"VairaSmythe")
        MsgBox Couldn't find your username on %URL%, try again...
      Else{
				;RegEx strings for finding each element...
				rNAM:="header-name"">([^<]*?)</span>"
				rNUM:="header-number"">\(#([^\)]*?)\)</span>"
				rSEX:="sex.*?strong>([^<]*?)<"
				rGEN:="> +([^<]*?)<br /> +<strong>([^<]*?)<"
				rHAT:="e""> +<strong>([^<]*?)</strong> +<br/>(\(.*?\))"
				rIMG:="<img src=""(/rendern.*?png)"

				;Actual search/grab code...
				RegExMatch(HTM,rNAM,NAM)
				RegExMatch(HTM,rNUM,NUM)
				RegExMatch(HTM,rSEX,SEX)
				c:=RegExMatch(HTM,rGEN,GCA)
				c:=RegExMatch(HTM,rGEN,GCB,c+1)
				c:=RegExMatch(HTM,rGEN,GCC,c+1)
				c:=RegExMatch(HTM,rHAT,HAT,c+1)
				c:=RegExMatch(HTM,rGEN,BRE,c+1)
				c:=RegExMatch(HTM,rGEN,EYE,c+1)
				RegExMatch(HTM,rIMG,IMG)
				IMG:="https://www1.flightrising.com" IMG1

				;Display found values...
				MsgBox 3,,% "Found your dragon...`n`n"
				. "Name: " NAM1
				. "`nNumber: " NUM1
				. "`nSex: " SEX1
				. "`nG1: " GCA1 " | " GCA2
				. "`nG2: " GCB1 " | " GCB2
				. "`nG3: " GCC1 " | " GCC2
				. "`nHatchday: " HAT1 " " HAT2
				. "`nBreed: " BRE1 " | " BRE2
				. "`nEye: " EYE1 " | " EYE2
				. "`nImage: " IMG
				. "`n`nIs this correct?"

        IfMsgBox Cancel
          ExitApp
        IfMsgBox Yes
          FLG:=1
      }
    }
  }
} Until FLG

BBCode=
(
[center][columns]
[center][url=http://flightrising.com/main.php?dragon=%NUM1%][img]%IMG%[/img][/url][/center]
[nextcol]
[center][img]http://flightrising.com/images/icons/small_%SEX1%.png[/img][/center]
 
[center][b]%NAM1%[/b]
 
[b]Common[/b] Eyes
[emoji=special eyes] [b]Rare[/b] Eyes [emoji=special eyes]
 
XXX [img]https://i.imgur.com/CcBMEav.png[/img]
XXY [img]https://i.imgur.com/CtSqRkl.png[/img]
XYY [img]https://i.imgur.com/K2saeum.png[/img]
XYX [img]https://i.imgur.com/0YzUjUS.png[/img]
 
[b]%GCA1%[/b] | %GCA2%
[b]%GCB1%[/b] | %GCB2%
[b]%GCC1%[/b] | %GCC2%
 
[emoji=treasure][color=#c38917][b]60KT[/b][/color][emoji=treasure]
Or
[emoji=gem][color=#5683e0][b]50[/b][/color][emoji=gem]
 
[size=2]Hatchday: %HAT1%[/size]
 
[center]BBCODE
[url=http://www1.flightrising.com/auction-house/buy-dragon/%NUM1%][img]http://flightrising.com/images/layout/button_buyauction.png[/img][/url][/center][/columns]
 
 
[img]https://dl.dropboxusercontent.com/s/zm9cim6xw0oxgcb/shadowmidsmall2.png[/img]
)

FileDelete % NAM1 "_" NUM1 ".txt"
FileAppend % BBCode,% NAM1 "_" NUM1 ".txt"
Run % NAM1 "_" NUM1 ".txt"
MsgBox 4,,Would you like to do another?
IfMsgBox Yes
  Reload
Else
  ExitApp
Return

GrabPage(URL) {
  TMP:=A_Temp "/" A_Now ".txt"
  URLDownloadToFile % URL,% TMP
  FileRead HTM,% TMP
  HTM:=RegExReplace(HTM,"`n")
  FileDelete % TMP
  Return HTM
}