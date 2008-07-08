/*
*******************************************
* �ber dieses Skript
*******************************************
Dies ist ein experimentelles Minimalbeispiel, um die noch fehlende 
Compose-Funktionalit�t in der neo20-all-in-one.ahk zu implementieren.

Konkret werden daf�r die sog. Hotstrings genutzt:
http://www.autohotkey.com/docs/Hotstrings.htm

Die eigentlichen Kombinationen sollen sp�ter aus den Linux-Sourcen
automatisch generiert werden.

Autoren: Matthias Berg, Dennis Heidsiek


*******************************************
* Kurze Beschreibung der Funktionsweise
*******************************************

compose aktiviert die hotstrings und die n�chsten oc (copyright) oder 12
(einhalb) werden ersetzt und deaktivieren es aber sofort.

Also {compose}neoocneo12  wird zu neo�neo12  (einhalb wird nicht ersetzt).
damit dies aber nicht unendlich lange geht (also erst ein paar W�rter sp�ter
eine Ersetzung erfolgt, weil nach Compose doch umentschieden wurde), wird mit
Space (vielleicht auch sp�ter mit anderen Tasten) compose wieder deaktiviert.

*******************************************
* Offene und noch zu l�sende Probleme:
*******************************************
- Anscheinend funktionieren die Compose-Kombinationen nicht mit umgemappten
  Tasten?

- {compose}r200 und {compose}r2000 k�nnen nicht eingegeben werden,
  da zuvor {compose}r20 erkannt und sofort verarbeitet wird
  
- K�nnen mit den Hotkeys auch die toten Tasten erzeugt werden, z.B.
  (in Linux-Schreibweise):
  <dead_stroke> <o> : "�" # LATIN SMALL LETTER O WITH STROKE
  
- Unbedingt die folgende noch fehlende Dokumentation erg�nzen, damit die
  Compose-Kombinationen von automatisch aus den Linux-Sourcen
  generiert werden k�nnen: Wof�r bzw. wann benutzt man:
  
  send a
  
  
  send {blind} a
  
  
  sendinput a
  
  
  sendinput {blind}a
  
  
  SendUnicodeChar(0x0061)
  
  
  BSSendUnicodeChar(0x0061)
  
  
  CompUnicodeChar(0x0061)
  
  
  Comp3UnicodeChar(0x0061)
  
  
  
  
  
*******************************************
* Gel�ste Probleme:
*******************************************

- {compose}r2000 und {compose}R2000 werden jetzt unterschieden:
  Alle Keystrings sind jetzt Case-sensitive (Parameter C)
  
*/





/*
********************************************
* Compose-Methoden 
*******************************************
*/

composeActive := 0  ; unsere neue Variable

~Space::composeActive := 0   ; Space und sp�ter andere Tasten sollten es deaktivieren
*CapsLock::return    ; capslock soll ja nichts einrasten :)

*tab::    ; Dies ist so �hnlich wie neo_tab:
  if (IsMod3Pressed()) { ;#
        composeActive := 1
      PriorDeadKey := "comp"
      CompKey := ""
   }
   else {
      send {blind}{Tab}
      PriorDeadKey := ""
      CompKey := ""
   }
return

IsMod3Pressed()
{
    return ( GetKeyState("CapsLock","P") or GetKeyState("#","P") )  ; # = SC02B
}

; Test: Funktionieren die Compose-Kombinationen auch noch, wenn Tasten umgemappt werden?
q::
   send r
return

w::
   send R
return

/*
*R:: sendinput {blind}r

********************************************
* Unicode-Methoden
********************************************
*/

SendUnicodeChar(charCode)
{
   VarSetCapacity(ki, 28 * 2, 0)

   EncodeInteger(&ki + 0, 1)
   EncodeInteger(&ki + 6, charCode)
   EncodeInteger(&ki + 8, 4)
   EncodeInteger(&ki +28, 1)
   EncodeInteger(&ki +34, charCode)
   EncodeInteger(&ki +36, 4|2)

   DllCall("SendInput", "UInt", 2, "UInt", &ki, "Int", 28)
}

BSSendUnicodeChar(charCode)
{
   send {bs}
   SendUnicodeChar(charCode)
}

CompUnicodeChar(charCode)
{
   send {bs}
	 SendUnicodeChar(charCode)
}

Comp3UnicodeChar(charCode)
{
   send {bs}
   send {bs}
   SendUnicodeChar(charCode)
}


EncodeInteger(ref, val)
{
   DllCall("ntdll\RtlFillMemoryUlong", "Uint", ref, "Uint", 4, "Uint", val)
}

