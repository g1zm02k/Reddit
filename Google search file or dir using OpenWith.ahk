FileName=%1%
FileName:=RegExReplace(FileName,"&","%26")
SplitPath FileName,Name,Dir,Ext,NameNoExt
If InStr(FileExist(FileName),"D") ;Dir?
  Run https://www.google.com/search?q=%Name%
Else                              ;File
  Run https://www.google.com/search?q=%NameNoExt%