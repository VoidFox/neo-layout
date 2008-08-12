﻿== Neo 2.0 für Windows ==
Für viele Windowsversionen sind hier Treiber zu finden.

== autohotkey ==
Hier befindet sich ein Treiber, der mit der Autohotkey-Scriptsprache (http://www.autohotkey.com) erstellt wurde. Hierfür muss lediglich eine ausführbare EXE-Datei heruntergeladen und gestartet werden.
Dazu benötigt man insbesondere keine Administratorrechte, wenn man das Programm beispielsweise in dem Verzeichnis „Eigene Dateien“ abspeichert, so dass sich dieser Treiber gut zum schnellen ausprobieren von NEO eignet. Zudem kann man diesen Treiber etwa von einem USB-Stick aus starten, wenn man auf einem fremden Rechner arbeiten muss/will:

== neo_portable.zip ==
Wenn man den Inhalt dieses zip-Archives auf einen USB-Stick entpackt, startet sich der Autohotkey-Treiber automatisch, sobald man den USB-Stick in den USB-Port steckt.

== kbdneo2 ==
Hier entsteht mit Hilfe des WinDDK (http://www.microsoft.com/whdc/devtools/ddk/default.mspx) ein nativer Windowstreiber mit allen 6 Ebenen, um Neo dauerhaft als Tastaturlayout auf einem Windows-PC zu installieren.
In dem Ordner befinden sich der Treiber für viele Windowsversionen und auch die Quelldateien. Bitte die jeweilige README.txt beachten. Dieser Treiber ist der älteren MSKLC-Variante überlegen.

== msklc ==
Im Verzeichnis msklc sind Dateien, die mit dem MS Keyboard Layout Creator erstellt wurden. Nach Installation der dort abgelegten Dateien, ist das NEO-Layout in das Windowssystem integriert, als wäre es eins der vielen anderen Layouts verschiedener Sprachen.
Man benötigt für die Installation jedoch Administratorrechte, weshalb man diese Variante nicht überall installieren kann. Außerdem ist diese Variante nicht mehr aktuell, stattdessen sollte der kbdneo2-Treiber installiert werden.


== Eigabe beliebiger Unicode-Zeichen unter Windows ==
Hierzu muss in der Registry der Schlüssel
HKEY_Current_User/Control Panel/Input Method/EnableHexNumpad
angelegt und auf den Wert "1" (vom Typ REG_SZ, d.h. »Zeichenkette«) gesetzt sein. Diese Änderung wird erst nach einem Neustart wirksam.

Anschließend können beliebige Unicode-Zeichen über die Angabe des heximalen Unicode-Wertes eingeben werden, beispielsweise das Unendlich-Zeichen ∞ (=UxU221E):
ALT-herunterdrücken + 2 2 1 e ALT-Loslassen 
Alternativ (oder wenn die Eingabe ein bischen komfortabler erfolgen soll) kann auch das folgende kleine Programm genutzt werden:
UnicodeInput — a utility to enter Unicode characters on Microsoft Windows
http://www.fileformat.info/tool/unicodeinput/index.htm


== Windows 95 und 98 ==
Für Windows 95 und 98 gibt es nur die Version 1 von NEO. Und zwar hier: [Link fehlt!]

[Zu klären/testen: Funktioniert der ahk oder der kbdneo2 auch noch unter Windows 95? Benutzt das noch jemand?]



