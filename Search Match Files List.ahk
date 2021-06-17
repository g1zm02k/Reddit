#NoEnv
#SingleInstance Force
Folder:="D:\Downloads\AHK\"                 ;Search Folder

F1::                                        ;Trigger Hotkey
  InputBox SRC,Search...,Enter search term: ;  SRC is our search term
  FileList:="",Counter:=0                   ;  Clear the list & counter
  Loop % Folder "*.*"                       ;  Search the spec folder/all files
    If RegExMatch(A_LoopFileName,"i)" SRC){ ;    If name matches the search term
      FileList.=A_LoopFileName "`n"         ;      Add it to the list
      Counter++                             ;      Increment counter
    }                                       ;    End If block
  If !Counter{                              ;  If counter=0
    MsgBox % "No matches found!"            ;    Say so
  }Else If (Counter=1){                     ;  If only 1 match
    Clipboard:=RegExReplace(FileList,"`n$") ;    Add name to clipboard
    MsgBox % "One name copied."             ;    Say so
  }Else{                                    ;  If multiple names found
    MsgBox % Counter " matches found..."    ;    Say how many
    Run Notepad.exe                         ;    Run Notepad
    Sleep 500                               ;    Let it start
    SendInput % FileList                    ;    Paste the list
  }                                         ;  End If bloack
Return                                      ;End code block