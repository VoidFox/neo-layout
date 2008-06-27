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

compose aktiviert die hotstrings und die n�chsten gr (copyright) oder 12
(einhalb) werden ersetzt und deaktivieren es aber sofort.

Also {compose}neogrneo12  wird zu neo�neo12  (einhalb wird nicht ersetzt).
damit dies aber nicht unendlich lange geht (also erst ein paar W�rter sp�ter
eine Ersetzung erfolgt, weil nach Compose doch umentschieden wurde), wird mit
Space (vielleicht auch sp�ter mit anderen Tasten) compose wieder deaktiviert.


********************************************
* Zu Testzwecken aufgenommene Kombinationen
* (in der Linux-Schreibweise)
********************************************

<Multi_key> <o> <c> "�" # copyright
<Multi_key> <1> <2> "�" # FRACTION 1/2
<Multi_key> <r> <2> <0> "xx" # SMALL ROMAN NUMERAL 20
<Multi_key> <r> <2> <0> <0> "cc" # SMALL ROMAN NUMERAL 200
<Multi_key> <r> <2> <0> <0> <0> "mm" # SMALL ROMAN NUMERAL 2000
<Multi_key> <r> <3> <9> <9> <9> "mmmcmxcix" # SMALL ROMAN NUMERAL 3999
<Multi_key> <R> <2> <0> <0> <0> "\u216f\u216f" # ROMAN NUMERAL 2000

*******************************************
* Offene und noch zu l�sende Probleme:
*******************************************

- {compose}r200 und {compose}r2000 k�nnen nicht eingegeben werden,
  da zuvor {compose}r20 erkannt wird
  
- Unbedingt die folgende noch fehlende Dokumentation erg�nzen, damit die
  Compose-Kombinationen von Dennis automatisch aus den Linux-Sourcen
  generiert werden k�nnen: Wann/wof�r benutzt man:
  
  send a
  
  
  send {blind} a
  
  
  SendUnicodeChar(0x0061)
  
  
  BSSendUnicodeChar(0x0061)
  
  
  CompUnicodeChar(0x0061)
  
  
  Comp3UnicodeChar(0x0061)
  
  
  
  
  
*******************************************
* Gel�ste Probleme:
*******************************************

- {compose}r2000 und {compose}R2000 werden jetzt unterschieden:
  Alle Keystrings sind jetzt Case-sensitive (Parameter c)
  
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

/*
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

