1. WinDDK installieren (Bestandteil von WDK, �ber das MSDN zu erhalten).

2. Im Ordner \src\input\layout\all_kbds\kbdneo2 des WDKs einen neuen Ordner namens 'kbdneo2' anlegen.

3. Alle Quelldateien in diesen Ordner kopieren.

4. Die Datei 'dirs' im Ordner \src\input\layout\all_kbds\ des WinnDDKs um die Zeile 'kbdneo2' erweitern. Die Datei k�nnte nun so aussehen:
> DIRS= \
>     kbdfr \
>     kbdgr \
>     kbdneo2

5. Mit einem normalem Texteditor k�nnen nun die Quelldateien bearbeitet werden. Kommentare befinden sich in den jeweiligen Dateien.

6. Zum kompilieren des Treibers die 'Checked Build Environment' starten und zum Ordner mit den Quelldateien wechseln und den Befehl �Build� ausf�hren.
>     cd src\input\layout\all_kbds\kbdneo2
>      build
