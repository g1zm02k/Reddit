SetKeyDelay 80
h::SKeys("ETTRTRTTTTTRTRTTTRTRRRTTTTTR")
SKeys(Keys){
  Loop Parse,Keys
    Send % (A_LoopField="E")?"{Esc}":(A_LoopField="T")?"{Tab}":"{Enter}"
}