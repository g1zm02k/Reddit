CoordMode Pixel
PixelGetColor pC,0,0,Fast RGB
If (SubStr(pC,7)="3A")        ;0x88883A
	MsgBox % "Found!"           ;      ^^
Else
	MsgBox % "Not Found..."
Return
