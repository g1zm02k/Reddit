^Del::						;Ctrl+Delete
	Directory:="D:\Downloads\_To Do\"	;Change this
	FileList := ""
	Loop, Files, % Directory "*.png", F
		FileList .= A_LoopFileTimeModified "\" A_LoopFileName "`n"
	Sort, FileList, R
	FileList:=RegExReplace(FileList, ".*?\\(.*?png)`n.*", "$1")
	MsgBox 4, Warning, % "Delete: " FileList "?"
	IfMsgBox Yes, FileDelete % Directory FileList
Return