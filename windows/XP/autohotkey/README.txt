Version 19.05.2007

== Installation ==

Hierf�r braucht man keine Administratorrechte, es muss jedoch 
zuerst das Programm namens �autohotkey�
(http://www.autohotkey.com/download/AutohotkeyInstall.exe) 
installiert werden.
Dazu ben�tigt man KEINE Administratorrechte, wenn man das Programm
beispielsweise in das Verzeichnis �Eigene Dateien/NEO� installiert.

=== ahk-Dateien ===

Danach kann man die .ahk-Skripte (neo20.ahk und neo20-remap.ahk) 
mit einem Doppelklick starten. 
Man erh�lt dann ein Systray-Icon, mit dem man das Skript vor�bergehend 
deaktivieren (Suspend) oder komplett beenden kann.
Wenn das �ffnen nicht direkt funktioniert: �ffnen mit -> Autohotkey.exe
ausw�hlen -> Immer mit diesem Programm �ffnen.

=== Automatischer Start ===

Bei Bedarf kann man sich Verkn�pfungen mit neo20.ahk und 
neo20-remap.ahk in den Autostart-Ordner legen, dann hat man das 
Layout direkt bei der Anmeldung.

== Wie es funktioniert ==

Das Programm kann alle Tastendrucke abfangen und statt dessen andere 
Tasten simulieren. Die Zeile
  a::send b
f�ngt z. B. die Taste a ab und sendet statt dessen ein b.
Die ahk-Dateien lassen sich mit einem Texteditor bearbeiten, man muss 
dann nur das Skript neu starten um die �nderungen zu �bernehmen.

== Bekannte Fehler ==

Das Umbelegen der Funktionstasten ist etwas �buggy� (siehe
http://www.autohotkey.com/forum/topic10169.html) und wurde deshalb 
in eine Extradatei ausgelagert (neo20-remap.ahk). 
Einfach beide Skripte starten.

Problem: Manchmal kommt nur Control Down an, aber nicht das Up, 
dann bleibt Control aktiv. 
L�sung ist dann, einmal die normale Controltaste zu dr�cken.
--> taucht bei mir inzwischen nicht mehr auf *auf Holz klopf*

Ohne die Remap-Datei k�nnen 
die 3. Ebene mit Ctrl+Win 
die 4. mit Ctrl+Win+Shift
die 5. mit AltGr 
die 6. mit AltGr+Shift
erreicht werden.

== Nummernblock ==

Der Nummernblock auf der 2. Ebene ist wahlweise
- bei AUSgeschaltetem Numlock  
- bei EINgeschaltetem Numlock mit Shift 
zu erreichen.
Der Nummernblock auf der 3. Ebene funktioniert bei EINgeschaltetem 
Numlock mit Mod3 (Caps/#).
Der Nummernblock auf der 4. Ebene ist wahlweise
- bei AUSgeschaltetem Numlock mit Mod3 + Shift 
- bei EINgeschaltetem Numlock �ber Mod5 
zu erreichen.
Da die 2. Ebene �ber Shift ebenfalls bei EINgeschaltetem Numlock
funktioniert ist das Ausschalten des Nummernblocks nicht unbedingt
n�tig.

Achtung!
AltGr + Pos1 = Abmelden
AltGr + Ende = Computer ausschalten
--> diese Kombinationen treten auf bei AUSgeschaltetem Numlock mit Mod5

== To Do ==

L�sst sich die neo20-remap.ahk in die Hauptdatei integrieren?
Ist mir bislang noch nicht gelungen.

Gesch�tztes Leerzeichen und schmales Leerzeichen auf 4./6. Ebene �ber 
Leertaste, finde ich keine ANSI-Darstellung f�r.

./, auf Mod5 5. Ebene

CapsLock auf Mod3 3. Ebene
