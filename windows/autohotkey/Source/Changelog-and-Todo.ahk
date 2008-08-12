/************************************
* NEO 2.0 (beta) AutoHotkey-Treiber *
*************************************

Autoren:
Stefan Mayer <stm (at) neo-layout. o r g>
Nora Gei�ler <nora_geissler (at) yahoo. d e>
Matthias Berg <neo (at) matthias-berg. e u>
Martin Roppelt <m.p.roppelt (at) web. d e>
Dennis Heidsiek <HeidsiekB (at) aol. c o m>
Matthias W�chter <matthias (at) waechter.wiz. a t>
...

*********
* TODO: *
*********
- Compose vollst�ndig implementieren (Welche Methode ist hierzu am besten geeignet?)
- ausgiebig testen... (besonders Vollst�ndigkeit bei Deadkeys)
- Bessere L�sung f�r das Leeren von PriorDeadKey finden, damit die Sondertasten nicht mehr abgefangen werden m�ssen.
- Testen, ob die Capslockl�sung (siehe *1:: ebene 1) auch f�r Numpad gebraucht wird
- Die Ebenen vom Tastenblock an die neue Referenz anpassen (wenn da ein Konsens gefunden wurde)

**********
* IDEEN: *
**********
- Die Varianten (lernModus, einHandNeo, Lang-s-Tastatur, Qwertz/pausieren) sollten einheitlich (de-)aktiviert werden, etwa �ber M4+F9-F12

******************
* CHANGEHISTORY: *
******************

Revision 749 (von Dennis Heidsiek)
- ? und � funktionieren wieder (Klammer vergessen)
Revision 748 (von Dennis Heidsiek)
- Neue Globale Variable �zeigeLockBoxen�: Soll mit MessageBoxen explizit auf das Ein- und Ausschalten des Mod{3,4}-Locks hingewiesen werden?
Revision 746 (von Martin Roppelt)
- Zur�cksetzen der Tastatur �ber M4+Esc
- #(2L) sendet nicht mehr '
- Variablen Ebene7 und Ebene8 zum Abfragen eingef�hrt
- s(12)(2L)-Bug von Matthias W�chter behoben
Revision 744 (von Stefan Mayer)
- Ebene4-Ziffernblock: auf neo_d nun Komma (wie Referenz), "NumPadKomma" gibt es nicht
Revision 743 (von Matthias W�chter, commit durch Stefan Mayer)
- Ebene4-Ziffernblock: NumPadAdd und NumPadSub korrigiert
Revision 740 (von Matthias W�chter, commit durch HCW)
- "Mega-Patch" (Skript verk�rzt, Ebenenabfrage ver�ndert, ...), siehe CHANGES.txt
- Blinde tote Tasten auf M4+F9 (Toggle)
- Blinde Compose auf M4+F10 (Toggle)
Revision 728 (von Dennis Heidsiek):
- Ist die Datei %APPDATA%\NEO2\NEO2.ini vorhanden, werden dort eventuell vorhandene Werte f�r die Globalen Schalter beim Start �bernommen
- �LangSTastaturStandardm��igEingeschaltet.ahk� wird nicht mehr unterst�tzt, weil sonst immer neu kompiliert werden muss
Revision 707 (von Dennis Heidsiek):
- Die Resourcen-Dateien (PNGs, ICOs) werden nun nach %TEMP%\NEO2\ extrahiert und nicht mehr in das Verzeichnis, in dem sich die EXE befindet
- Die doppelten franz�sischen Anf�hrungszeichen werden nun ebenfalls �ber SendUnicodeChar gesendet
Revision 694 (von Martin Roppelt):
- LangSTastatur auf M4+F11
- Entwickler k�nnen durch das Erstellen einer Datei �LangSTastaturStandardm��igEingeschaltet.ahk� mit dem Inhalt �LangSTastatur := 1� diese standardm��ig aktivieren
- Mehrere DeadKeys aktualisiert (T*, Ebene 4 und T*, Ebene 5)
Revision 687 (von Dennis Heidsiek):
- Die SendUnicodeChar-Methode um den GDK-Workarround von Matthias W�chter erg�nzt
- (An/Aus) Icons an Favicon der neuen Homepage angepasst
Revision 645 (von Martin Roppelt):
- Ellipse zus�tzlich auf M3+x
- Lang-s-Tastatur probeweise auf M4+Esc
Revision 640 (von Dennis Heidsiek):
- Der untote Zirkumflex (^) auf Ebene 3 funktioniert jetzt auch in Java-Programmen
Revision 639 (von Martin Roppelt):
- Lang-s-Tastatur kann nicht mehr durch einen Hotkey aktiviert werden
Revision 629 (von Martin Roppelt):
- Spitze Klammern (bra und ket) auf M5+8/9
Revision 624 (von Martin Roppelt):
- Lang-s-Tastatur (ein- und auszuschalten durch Mod4+�)
Revision 616 (von Dennis Heidsiek):
- Der nicht funktionierende Mod5-Lock-Fix wurde wieder entfernt, da er sogar neue Fehler produzierte
Revision 615 (von Dennis Heidsiek):
- Erfolgloser Versuch, den Mod4-Lock wiederherzustellen (durch eine Tilde vor den Scancodes der Bildschirmtastatur)
- Rechtschreibfehler korrigiert
- Zwei AHK-Links eingef�gt
Revision 609 (von Dennis Heidsiek):
- Vorl�ufiger Abschluss der AHK-Modularisierung
- Bessere Testm�glichkeit �All.ahk� f�r AHK-Entwickler hinzugef�gt, bei der sich die Zeilenangaben in Fehlermeldungen auf die tats�chlichen Module und nicht auf das gro�e �vereinigte� Skript beziehen
Revision 608 (von Martin Roppelt):
- Rechtschreibfehler korrigiert und Dateinamen aktualisiert und sortiert
Revision 590 (von Dennis Heidsiek):
- Erste technische Vorarbeiten zur logischen Modularisierung des viel zu lange gewordenen AHK-Quellcodes
- Neue Batch-Datei Build-Update.bat zur einfachen Aktualisierung der EXE-Datei
Revision 583 (von Dennis Heidsiek):
- Kleinere Korrekturen (M3+NP5, M5+NP5 und M3+NP9 stimmen wieder mit der Referenz �berein)
Revision 580 (von Matthias Berg):
- Bildschirmtastatur jetzt mit Mod4+F* statt Strg+F*, dies deaktiviert jedoch leider den Mod4-Lock
Revision 570 (von Matthias Berg):
- Hotkeys f�r einHandNeo und lernModus durch entsprechende ScanCodes ersetzt 
Revision 568 (von Matthias Berg):
- Sonderzeichen, Umlaute, z und y durch ScanCodes ersetzt
  * jetzt wird auch bei eingestelltem US Layout Neo verwendet (z.B. f�r Chinesische InputMethodEditors)
  * rechter Mod3 geht noch nicht bei US-Layout (weder ScanCode noch "\")
Revision 567 (von Dennis Heidsiek):
- Aktivierter Mod4-Lock wird jetzt �ber die Rollen-LED des Keybord angezeigt (analog zu CapsLock), die Num-LED beh�lt ihr bisheriges Verhalten
- Neue Option im Skript: UseMod4Light
Revision 561 (von Matthias Berg):
- M4+Tab verh�lt sich jetzt wie das andere Tab dank "goto neo_tab"
Revision 560 (von Dennis Heidsiek):
- Neue Option im Skript: bildschirmTastaturEinbinden bindet die PNG-Bilder der Bildschirmtastur mit in die exe-Datei ein, so dass sich der Benutzer nur eine Datei herunterladen muss
Revision 559 (von Matthias Berg):
- Shift+Alt+Tab Problem gel�st (muss noch mehr auf Nebeneffekte getestet werden)
Revision 558 (von Matthias Berg):
- Icon-Bug behoben
  * Hotkeys d�rfen nicht vor der folgenden Zeile stehen:
   "menu, tray, icon, neo.ico,,1"
- lernModus-Konfigurations-Bug behoben: or statt and(not)
- Ein paar leere Else-F�lle eingebaut (Verst�ndlichkeit, m�gliche Compilerprobleme vermeiden)   
Revision 556 (von Matthias Berg):
- lernModus (an/aus mit Strg+Komma)
  * im Skript konfigurierbar
  * Schaltet z.B. Qwertz Tasten aus, die es auf der 4. Ebene gibt (Return, Backspace,...)
  * Kann auch Backspace und/oder Entfernen der 4. Ebene ausschalten (gut zum Lernen, richtig zu schreiben)
- Bug aufgetaucht: Icons werden nicht mehr angezeigt
Revision 544 (von Stefan Mayer):
- ,.:; auf dem Mod4-Ziffernblock an die aktuelle Referenz angepasst
- Versionen von rho, theta, kappa und phi an die aktuelle Referenz angepasst
Revision 542 (von Matthias Berg):
- bei EinHandNeo ist jetzt Space+y auch Mod4
- AltGr-Bug  hoffentlich wieder behoben. Diesmal mit extra altGrPressed Variable
- nurEbenenFuenfUndSechs umbenannt in ahkTreiberKombi und auf Ebene 4 statt 5 und 6 ge�ndert
Revision 540 (von Matthias Berg):
- stark �berarbeitet um Wartbarkeit zu erh�hen und Redundanz zu verringern
- nurEbenenFuenfUndSechs sollte nun auch auf Neo Treiber statt Qwertz laufen
  * aber es muss noch jemand testen
  * Problem: was kann man abfangen, wenn eine tote Taste gedr�ckt wird
- einHandNeo:
  * An-/Ausschalten mit Strg+Punkt
  * Buchstaben der rechten Hand werden mit Space zur linken Hand
  * Nebeneffekt: es gibt beim Festhalten von Space keine wiederholten Leerzeichen mehr
Revision 532 (von Matthias Berg):
- BildschirmTastatur 
  * aktiviert mit Strg+F1 bis 7, schaltet Keyboard ein oder aus
  * Strg+F7 zeigt die zuletzt angezeigte Ebene an (und wieder aus)
  * Strg+F8 schaltet AlwaysOnTop um    
Revision 529 (von Stefan Mayer):
- Icon wird automatisch geladen, falls .ico-Dateien im selbem Ordner
- In der .exe sind die .ico mitgespeichert und werden geladen
Revision 528 (von Matthias Berg):
- Neo-Icon
- Neo-Prozess jetzt automatisch auf hoher Prioritaet
  (siehe globale Schalter)
- Mod3-Lock (nur wenn rechtes Mod3 zuerst gedr�ckt wird, andere L�sung f�hrte zum Caps-Bug)
- Mod4-Lock (nur wenn das linke Mod4 zuerst gedr�ckt wird, andere L�sung f�hrte zum AltGr-Bug)
- Ein paar falsche Zeichen korrigiert
Revision 527 (von Matthias Berg):
- AltGr-Problem hoffentlich behoben
- Umschalt+Mod4-Bug behoben
Revision 526 (von Matthias Berg):
- Ebenen 1 bis 4 ausschalten per Umschalter siehe erste Codezeile nurEbenenFuenfUndSechs = 0
- Mod4-Lock durch Mod4+Mod4
- EbenenAktualisierung neu geschrieben
- Ebene 6 �ber Mod3+Mod4
- Ebenen (besonders Matheebene) an Referenz angepasst (allerdings kaum um Ebenen 1&2 gek�mmert, besonders Compose k�nnte noch �berholt werden)
Revision 525 (von Matthias Berg):
- Capslock bei Zahlen und Sonderzeichen ber�cksichtigt
Revision 524 (von Matthias Berg):
- umgekehrtes ^ f�r o, a, �,i  sowie f�r die grossen vokale ( 3. ton chinesisch)
  � damit wird jetzt PinYin vollst�ndig unterst�tzt caron, macron, akut, grave auf uiaeo�
- Sonderzeichen senden wieder blind -> Shortcuts funktionieren, Capslock ist leider Shiftlock
Revision 523 (von Matthias Berg):
- CapsLock geht jetzt auch bei allen Zeichen ('send Zeichen' statt 'send {blind} Zeichen')
- vertikale Ellipse eingebaut
- Umschalt+Umschalt f�r Capslock statt Mod3+Mod3
- bei Suspend wird jetzt wirklich togglesuspend aufgerufen (auch beim Aktivieren per shift+pause)
Revsion 490 (von Stefan Mayer): 
- SUBSCRIPT von 0 bis 9 sowie (auf Ziffernblock) + und -
  � auch bei Ziffernblock auf der 5. Ebene
- Kein Parsen �ber die Zwischenablage mehr
- Vista-kompatibel
- Compose-Taste
  � Br�che (auf Zahlenreihe und Hardware-Ziffernblock)
  � r�mische Zahlen
  � Ligaturen und Copyright
*/

