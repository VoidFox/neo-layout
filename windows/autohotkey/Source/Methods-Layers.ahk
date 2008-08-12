/*
   ------------------------------------------------------
   Modifier
   ------------------------------------------------------
*/


;LShift+RShift == CapsLock (simuliert)
; Es werden nur die beiden Tastenkombinationen abgefragt,
; daher kommen LShift und RShift ungehindert bis in die
; Applikation. Dies ist aber merkw�rdig, da beide Shift-
; Tasten nun /modifier keys/ werden und, wie in der AHK-
; Hilfe beschrieben, eigentlich nicht mehr bis zur App
; durchkommen sollten.

VKA1SC136 & VKA0SC02A:: ; RShift, dann LShift
VKA0SC02A & VKA1SC136:: ; LShift, dann RShift
;
; mit diesen funktioniert das automatische �bernehmen der
; gedr�ckten Shift-Tasten nicht, also z.B. Shift-Ins, wenn Ins
; bei gedr�ckter Shift-Taste {blind} gesendet wird
; *VKA1SC136::
; *VKA0SC02A::
   if (GetKeyState("VKA1SC136", "P") and GetKeyState("VKA0SC02A", "P"))
      send {blind}{CapsLock}
return


; Mod3+Mod3 == Mod3-Lock
; Im Gegensatz zu LShift+RShift werden die beiden Tasten
; _nicht_ zur Applikation weitergeleitet, da '#' kein
; Modifier ist und CapsLock sonst den CapsLock-Status
; beeinflusst. Daf�r werden s�mtliche Events dieser
; Tasten abgefangen, und nur bei gleichzeitigem Dr�cken
; wird der Mod3-Lock aktiviert und angezeigt.

IsMod3Locked := 0
; VKBFSC02B & VK14SC03A::
; VK14SC03A & VKBFSC02B::
*VKBFSC02B:: ; #
*VK14SC03A:: ; CapsLock
   if (GetKeyState("VKBFSC02B", "P") and GetKeyState("VK14SC03A", "P"))
   {
      if (IsMod3Locked) 
      {
         IsMod3Locked = 0
         MsgBox Mod3-Feststellung aufgebehoben
      }
      else
      {
         IsMod3Locked = 1
         MsgBox Mod3 festgestellt: Um Mod3 wieder zu l�sen dr�cke beide Mod3 Tasten gleichzeitig 
      }
   }
return

; Mod4+Mod4 == Mod4-Lock
; Wie bei Mod3-Lock werden im Gegensatz zu LShift+RShift 
; die beiden Tasten _nicht_ zur Applikation weitergeleitet,
; und nur bei gleichzeitigem Dr�cken wird der Mod4-Lock
; aktiviert und angezeigt.

IsMod4Locked := 0
; VKA5SC138 & VKE2SC056:: ; AltGr, dann <
; VKE2SC056 & VKA5SC138:: ; <, dann AltGr
*VKA5SC138::
*VKE2SC056::
   if (GetKeyState("VKA5SC138", "P") and GetKeyState("VKE2SC056", "P"))
   {
      ; Mod4-Lock durch Mod4(rechts)+Mod4(links)
      if (IsMod4Locked) 
      {
         MsgBox Mod4-Feststellung aufgebehoben
         IsMod4Locked = 0
         if (UseMod4Light==1)
         {
            KeyboardLED(1,"off")
         }
      }
      else
      {
         MsgBox Mod4 festgestellt: Um Mod4 wieder zu l�sen dr�cke beide Mod4 Tasten gleichzeitig
         IsMod4Locked = 1
         if (UseMod4Light==1)
         {
            KeyboardLED(1,"on")
         }
      }
   }
return
