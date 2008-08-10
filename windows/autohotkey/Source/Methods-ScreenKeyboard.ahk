/*
   ------------------------------------------------------
   BildschirmTastatur
   ------------------------------------------------------
*/
guiErstellt = 0
alwaysOnTop = 1

*F1::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto Switch1
  else
    send {blind}{F1}
return

*F2::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto Switch2
  else
    send {blind}{F2}
return

*F3::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto Switch3
  else
    send {blind}{F3}
return

*F4::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto Switch4
  else
    send {blind}{F4}
return

*F5::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto Switch5
  else
    send {blind}{F5}
return

*F6::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto Switch6
  else
    send {blind}{F6}
return

*F7::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto Show
  else
    send {blind}{F7}
return

*F8::
  if (isMod4Pressed() and zeigeBildschirmTastatur)
    goto ToggleAlwaysOnTop
  else
    send {blind}{F8}
return

Switch1:
  tImage := ResourceFolder . "\ebene1.png"
  goto Switch
Return

Switch2:
  tImage := ResourceFolder . "\ebene2.png"
  goto Switch
Return

Switch3:
  tImage := ResourceFolder . "\ebene3.png"
  goto Switch
Return

Switch4:
  tImage := ResourceFolder . "\ebene4.png"
  goto Switch
Return

Switch5:
  tImage := ResourceFolder . "\ebene5.png"
  goto Switch
Return

Switch6:
  tImage := ResourceFolder . "\ebene6.png"
  goto Switch
Return

Switch:
  if (guiErstellt) 
  {
     if (Image = tImage)
        goto Close
     else
     {
       Image := tImage
       SetTimer, Refresh
     }
  }
  else 
  {
    Image := tImage
    goto Show    
  }
Return

Show:
  if (guiErstellt) 
  {
     goto Close
  }
  else
  {
    if (Image = "") 
    {
      Image := ResourceFolder . "\ebene1.png"
    }     
    yPosition := A_ScreenHeight -270
    Gui, Color, FFFFFF
    Gui, Add, Button, xm+5 gSwitch1, F1
    Gui, Add, Text, x+5, kleine Buchstaben
    Gui, Add, Button, xm+5 gSwitch2, F2
    Gui, Add, Text, x+5, gro�e Buchstaben
    Gui, Add, Button, xm+5 gSwitch3, F3
    Gui, Add, Text, x+5, Satz-/Sonderzeichen
    Gui, Add, Button, xm+5 gSwitch4, F4
    Gui, Add, Text, x+5, Zahlen / Steuerung
    Gui, Add, Button, xm+5 gSwitch5, F5
    Gui, Add, Text, x+5, Sprachen
    Gui, Add, Button, xm+5 gSwitch6, F6
    Gui, Add, Text, x+5, Mathesymbole
    Gui, Add, Button, xm+5 gShow, F7
    Gui, Add, Text, x+5, An /
    Gui, Add, Text, y+3, Aus
    Gui, Add, Button, x+10 y+-30 gShow, F8
    Gui, Add, Text, x+5, OnTop
    Gui, Add, Picture,AltSubmit ys w564 h200 vPicture, %Image%
    Gui, +AlwaysOnTop
    Gui, Show, y%yposition% Autosize
;    SetTimer, Refresh
    guiErstellt = 1
  } 
Return

Close:
  guiErstellt = 0
  Gui, Destroy
Return

Refresh:
   If (Image != OldImage)
   {
      GuiControl, , Picture, %Image%
      OldImage := Image
   }
Return

ToggleAlwaysOnTop:
    if (alwaysOnTop)
    {
      Gui, -AlwaysOnTop
      alwaysOnTop = 0    
    }
    else
    {
      Gui, +AlwaysOnTop
      alwaysOnTop = 1
    }
Return
 ; Ende der BildschirmTastatur


/*
   ------------------------------------------------------
   Shift+Pause "pausiert" das Script.
   ------------------------------------------------------
*/

*pause::
Suspend, Permit
   if isshiftpressed()
     goto togglesuspend
   else
     send {blind}{pause}
return

; ------------------------------------

^.::einHandNeo := not(einHandNeo)  ; Punkt
^,::lernModus := not(lernModus)    ; Komma



togglesuspend:
   if A_IsSuspended
   {
      menu, tray, rename, %enable%, %disable%
      menu, tray, tip, %name%
      if (iconBenutzen)
          menu, tray, icon, %ResourceFolder%\neo.ico,,1  
      suspend , off ; Schaltet Suspend aus -> NEO
   }
   else
   {
      menu, tray, rename, %disable%, %enable%
      menu, tray, tip, %name% : Deaktiviert
      if (iconBenutzen)
         menu, tray, icon, %ResourceFolder%\neo_disabled.ico,,1
      suspend , on  ; Schaltet Suspend ein -> QWERTZ 
   }

return


help:
   Run, %A_WinDir%\hh mk:@MSITStore:autohotkey.chm
return


about:
   msgbox, 64, %name% � Ergonomische Tastaturbelegung, 
   (
   %name% 
   `nDas Neo-Layout ersetzt das �bliche deutsche 
   Tastaturlayout mit der Alternative Neo, 
   beschrieben auf http://neo-layout.org/. 
   `nDazu sind keine Administratorrechte n�tig. 
   `nWenn Autohotkey aktiviert ist, werden alle Tastendrucke 
   abgefangen und statt dessen eine �bersetzung weitergeschickt. 
   `nDies geschieht transparent f�r den Anwender, 
   es muss nichts installiert werden. 
   `nDie Zeichen�bersetzung kann leicht �ber das Icon im 
   Systemtray deaktiviert werden.  `n
   )
return


neo:
   run http://neo-layout.org/
return

autohotkey:
   run http://autohotkey.com/
return

open:
   ListLines ; shows the Autohotkey window
return

edit:
   edit
return

reload:
   Reload
return

hide:
   menu, tray, noicon
return

exitprogram:
   exitapp
return
