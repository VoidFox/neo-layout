== Installation ==
Hierf�r braucht man keine Administratorrechte, es muss jedoch zuerst das
Programm namens �autohotkey�
(http://www.autohotkey.com/download/AutohotkeyInstall.exe) installiert werden.
Dazu ben�tigt man KEINE Administratorrechte, wenn man das Programm
beispielsweise in das Verzeichnis �Eigene Dateien/NEO� installiert.

=== ahk-Dateien ===
Danach kann man .ahk-Skripte mit einem Doppelklick starten. Man erh�lt 
dann ein Systray-Icon, mit dem man das Skript vor�bergehend deaktivieren 
(Suspend) oder komplett beenden kann.
Wenn das �ffnen nicht direkt funktioniert: �ffnen mit -> Autohotkey.exe
ausw�hlen -> Immer mit diesem Programm �ffnen.

=== Automatischer Start ===
Bei Bedarf kann man sich eine Verkn�pfung mit neo20.ahk in den 
Autostart-Ordner legen, dann hat man das Layout direkt bei der Anmeldung.

== Wie es funktioniert ==
Das Programm kann alle Tastendrucke abfangen und statt dessen andere Tasten
simulieren. Die Zeile
  a::send b
f�ngt z. B. die Taste a ab und sendet statt dessen ein b.
Die ahk-Dateien lassen sich mit einem Texteditor bearbeiten, man muss dann 
nur das Skript neu starten um die �nderungen zu �bernehmen.

== Bekannte Fehler ==
Das Umbelegen der Funktionstasten ist etwas �buggy� (siehe
http://www.autohotkey.com/forum/topic10169.html) und wurde deshalb in 
eine Extradatei ausgelagert (neo20-remap.ahk). 
Verwendung auf eigene Gefahr, einfach beide Skripte starten.

Problem: Auf der 5. und 6. Ebene kommt (bei Verwendung von AltGr) nur 
Control Down an, aber nicht das Up, dann bleibt Control aktiv. 
L�sung ist dann, einmal die normale Controltaste zu dr�cken.
Mod5 auf < hat das Problem nicht.

Ohne die Remap-Datei kann die 5. Ebene mit Ctrl+Win erreicht werden
(6. entsprechend mit Ctrl-Win-Shift).

== To Do ==
Dead Keys: Bislang funktionieren nur die Deadkeys, die auch im normalen deutschen Layout vorkommen.
Alle anderen k�nnen �ber Hotstrings definiert werden:
  ::~a::� 
usw.

Nummernblock