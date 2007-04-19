/*
  Umbelegung von AltGr auf CapsLock und #,
  daf�r Mod5 auf AltGr und <
*/

#singleinstance force
#usehook on

name = Umbelegung AltGr und Mod5
menu, tray, tip, %name%

; F�r 3. und 4. Ebene:
; CapsLock und # (SC02B) werden zu AltGr (SC138):

*CapsLock::
*SC02B::
Send {SC138 Down}
return

*CapsLock Up::
*SC02B Up::
Send {SC138 Up} 
return


; F�r 5. und 6. Ebene:
; < (SC056) und AltGr werden zu Win + Ctrl:
;Code funktioniert noch nicht so ganz, manchmal kommt nur Control Down an, aber nicht das Up, dann bleibt Control aktiv - L�sung ist dann, einmal die normale Controltaste zu dr�cken
; Was sonst noch helfen kann:
; Nach dem Dr�cken des Modifiers einen kleinen Moment warten
; Soll mehr als ein Buchstabe auf der 5.\6. Ebene geschrieben werden, zwischendurch den Modifier loslassen

*SC056::
*SC138::
Send {RWin Down}
Send {Control Down}
return

*SC056 Up::
*SC138 Up::
Send {Control Up} 
Send {RWin Up} 
return


