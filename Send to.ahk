Global App:="C:\Program Files\Video Thumbnails Maker\VideoThumbnailsMaker.exe"

#If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExplorerWClass")
F1::
  Explorer_GetSelection(hwnd=""){
    WinGet process,processName,% "ahk_id" hwnd:=hwnd?hwnd:WinExist("A")
    WinGetClass class,ahk_id %hwnd%
    If  (process="explorer.exe") 
      If (class ~= "(Cabinet|Explore)WClass"){
        For window in ComObjCreate("Shell.Application").Windows
          If (window.hwnd==hwnd)
            File:=window.Document.FocusedItem.path
      }
    Run % App " """ File ""
    SetTimer tCheck,500
  }
Return
#If

tCheck:
  If WinExist("ahk_exe VideoThumbnailsMaker.exe"){
    ControlSend ,,{Enter},% App
  }
Return