Coordmode Pixel,Client
vNOW:=0

F7::SetTimer Fireball,% (fTOG:=!fTOG)?100:"Off"

Fireball:
  PixelGetColor pCOL,408,89
  If (pCOL=0x101410 || A_TickCount-vNOW>30000){
    Random vRND,250,500
    Sleep vRND
    Send 7
    Random vRND,250,500
    Sleep vRND
    Send 7
    vNOW:=A_TickCount
  }
Return