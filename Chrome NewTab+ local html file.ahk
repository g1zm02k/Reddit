#Persistent
CoordMode Mouse		            ;Set Mouse screen-wide origin
CoordMode Pixel               ;Set Pixel screen-wide origin
SetTimer WatchCursor,100 
WatchCursor:
  MouseGetPos mx,my,mw,mc     ;Track Mouse x,y,win,class
  PixelGetColor pc,mx,my,RGB  ;Track Pixel colour (RGB)
  ToolTip % mc "`n" pc        ;Display results
Return

#If (WinActive("ahk_class Chrome_WidgetWin_1") && ((pc=0x434446) || (pc=0xC7CBCF)))
  LButton::Run Chrome.exe Path_To_OfflinePage.html
#If



