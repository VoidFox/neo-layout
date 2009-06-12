= Informationen über Compose =
Für die Installation und den Gebrauch der Compose-Funktion siehe
https://wiki.neo-layout.org/wiki/Tote%20Tasten%20und%20Compose


===================================================================================
= Die folgenden Informationen sollten Stück-für-Stück ins Wiki übertragen werden! =
===================================================================================


=== Installation/Anleitung zur Benutzung ===

==== Mit Root-/Administrator-Rechten ====
Um die Ergänzungen systemweit zu benutzen, muss man die Datei Compose.neo an
die alte Compose anhängen. Dies geht in der Konsole folgendermaßen:

	# Sicherung der alten Compose
	cp /usr/share/X11/locale/en_US.UTF-8/Compose \
		/usr/share/X11/locale/en_US.UTF-8/Compose.original
	# Zusammenfügen der alten Compose und der Neo-Ergänzungen
	cat /usr/share/X11/locale/en_US.UTF-8/Compose.original Compose.neo > \
		/usr/share/X11/locale/en_US.UTF-8/Compose

==== Ohne Root-Rechte/lokal ====
Einfach den Inhalt der originalen Compose-Datei und die Compose.neo in eine 
Datei namens ~/.XCompose (also im HOME-Verzeichnis) kopieren. 
Dies geht in der Konsole folgendermaßen:
	# Zusammenfügen der alten Compose und der Neo-Ergänzungen
	cat /usr/share/X11/locale/en_US.UTF-8/Compose Compose.neo > ~/.XCompose

==== Inkrafttreten der Änderungen ====
Die Änderungen werden sofort wirksam, allerdings nur für Programme, die nach 
dem Ändern der Compose gestartet wurden. Die Folge ist, dass unterschiedliche 
Programme mit unterschiedlichen Versionen der Compose arbeiten können. Das 
heißt, die Compose wird nicht zentral verwaltet und kann darum nicht für 
bereits laufende Programme erneut eingelesen werden.

==== Gnome macht Probleme ====
Wenn man unter Gnome Kombinationen wie ^+1, ^+2 oder ^+3 eingibt, erscheinen
die entsprechenden Hochgestellten ¹²³. Aber mit ^+4, ^+5 geht das nicht. 
Ebenso mit viele anderen eingentlich definierten Kombinationen. Das liegt 
daran, dass Gnome da noch irgendwas eigenes vorschaltet. Aber nach:
  export GTK_IM_MODULE=xim
klappt auch das. Siehe auch:
  https://help.ubuntu.com/community/ComposeKey
Zudem scheint dieses Problem in aktuelleren Gnome-Versionen behoben worden 
zu sein:
  http://blogs.gnome.org/simos/2008/01/30/improving-input-method-support-in-gtk-based-apps/
  http://blogs.gnome.org/simos/2008/03/05/testing-the-updated-im-support-in-gtk/

=== Überschreiben vorhandener Cokos ===
Falls einmal bereits vorhandene Kombinationen bewusst umdefiniert werden
sollten, ist es wichtig, dass die Compose.neo am Ende der Compose eingefügt 
wird, da bei mehrfach vorhandenen Kombinationen stets die letzte gültig ist.

=== Die en_US.neo – Eine Liste essentieller Compose-Kombinationen (Cokos) ===
In der Datei en_US.neo befinden sich alle Cokos, die nicht irgendwie arabisch,
kyrillisch, weißrussisch, koreanisch, japanisch, chinesisch oder einer anderen
nicht-europäischen Sprache behaftig sind, zusammengefasst. Auf diese Weise
reduziert sich die Dateigröße um mehr als die Hälfte. Diese Liste kann etwa als
Basis für die Implementierung von Compose unter Nicht-Linux-Betriebssystemen
genutzt werden; sie ist allerdings nur eine Teilmenge der Compose-Referenz und
sollte nicht mit ihr verwechselt werden!

=== Zur korrekten Darstellung empfohlene Schriftarten ===
Unter Windows ist in der Grundinstallation eventuell keine Schrift installiert, die alle hier gezeigten Unicodezeichen beinhaltet. Abhilfe schafft z.B. DejaVu:
http://dejavu.sourceforge.net/
oder Libertine:
http://linuxlibertine.sourceforge.net/

Unter Linux ist es ähnlich. Je nach Schrift (also je nach Editor) können auch nicht alle Zeichen angezeigt werden. Auch hier wird die Linux Libertine empfohlen:
http://linuxlibertine.sourceforge.net/

Zudem kann es helfen, die Datei nicht in einem Editor oder Browser (z.B.
Firefox, Version 3.0 oder besser) darzustellen, der die in der aktuellen 
Schrift nicht vorhandene Zeichen durch eine andere Schrift (in der sie 
vorhanden sind) automatisch ersetzen kann.
