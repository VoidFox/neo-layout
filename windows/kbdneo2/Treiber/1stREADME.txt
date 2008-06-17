== Installation der Windows-Treiber ==
Zur Zeit gibt es leider noch keine eigene Installationsroutine f�r diese Treiber.
Deshalb muss der Treiber noch von Hand registriert werden.

Installation:
1.) reg_backup.bat ausf�hren.
    Dies sichert einen bereits vorhandenen Schl�ssel. Wenn der Schl�ssel
    bislang noch nicht vorhanden war wird auch keine Sicherungsdatei angelegt.
2.) kbdneo2.dll nach \%SystemRoot%\system32\ (in der Regel C:\Windows\system32\)
    kopieren.
3.) kbdneo2_install.reg ausf�hren.
4.) Nun kann das in den Sprachoptionen Neo 2.0 ausgew�hlt werden. D(Start->Einstellungen->Systemsteuerung) unter �Regions- und Sprachoptionen� -> Reiter �Sprachen� -> �Details� -> �Hinzuf�gen� -> �Tastaturlayout/IME� -> �Deutsch (NEO ergonomisch 2.0)� hinzugef�gt werden.

Deinstallation:
1.) Neo 2.0 nicht mehr als Tastaturlayout verwenden. Dazu das Layout in den     �Regions- und Sprachoptionen� entfernen.
2.) kbdneo2_uninstall.reg ausf�hren. Hierbei werden alle vorgenommenen Eintr�ge in      der Registry gel�scht.
3.) Falls vorhanden die gesicherten Schl�ssel zur�ckspielen (backup1.reg,     backup2.reg und backup3reg �soweit vorhanden� ausf�hren)

Je nach Windows-Version sind f�r die einzelnen Schritte Administrator-Rechte n�tig.


== Einschr�nkungen dieser Treiberversion ==
1.) Einige spezielle Funktionen lassen sich nicht belegen und sind deshalb nicht
    verf�gbar.
    Dazu geh�ren leider die Pfeiltasten, Entf, Seite hoch/runter, Einfg, Pos1 und
    Ende.
2.) Ein Einrasten von Modifiern ist treibertechnisch leider nicht m�glich.
3.) Die Kombo-/Komponier-/Compose-Taste wird von Windows nicht unterst�tzt.

Diese M�ngel sollen durch einen spezielle AutoHotKey-Treiber noch behoben werden.


== Entfernen einer evtl. vorhandenen MSKLC-Treibers ==
1. Setup des MSKLC aufrufen
2. �Remove the keyboard layout� ausw�hlen und mit �Finish� best�tigen.

