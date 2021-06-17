inFolder:="C:\temp\Move From"
outFolder:="C:\temp\Move To"

Loop Read,C:\information.txt
{
  folder:=A_LoopReadLine
  newFolder:=outFolder "\" folder
  Loop Files,% inFolder "\*.*",FD
    If (Instr(A_LoopFileName,folder))
      FileMoveDir % A_LoopFileFullPath,% newFolder 
}
Return