<?xml version="1.0" encoding="UTF-8">
<xsl:stylesheet version=1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
-------------------------------------------------------------------------------
ACHTUNG: 
Damit alles ordentlich dargestellt wird, muss man für die Darstellung z. B. im
Texteditor eine dicktengleiche Schrift einstellen!

Im Browser (Firefox) muss man unter Ansicht, Zeichenkodierung auf Unicode
(UTF-8) stellen.

Unter Windows ist in der Grundinstallation leider keine dicktengleiche Schrift 
installiert, die befriedigend viele Unicodezeichen beinhaltet.
Abhilfe schafft z. B. DejaVu Sans Mono (ist z. B. bei OpenOffice dabei):
http://dejavu.sourceforge.net/
-------------------------------------------------------------------------------

== Haupttastatur ==
=== Legende – Haupttastatur ===
┌─────┐ 1 … 1. Ebene (kein Mod)     │ 4 … 4. Ebene (Mod4)
│2 4 6│ 2 … 2. Ebene (Umschalt)     │ 5 … 5. Ebene (Mod3+Umschalt)
│1 3 5│ 3 … 3. Ebene (Mod3)         │ 6 … 6. Ebene (Mod3+Mod4)
└─────┘
• Ebene 1: Kleinbuchstaben                   (kein Mod) 
• Ebene 2: Großbuchstaben                    (Umschalt)
• Ebene 3: Sonderzeichen                     (Mod3)
• Ebene 4: Navigation und Ziffernblock       (Mod4)
• Ebene 5: Griechische Kleinbuchstaben       (Mod3+Umschalt)
• Ebene 6: Griechische Großbuchstaben        (Mod3+Mod4)

• Kombo/Compose: Zusammensetzen von Zeichen (Mod3+Tab)
  Beispiel:
  »Compose« »Compose loslassen« »o« »c« = ©
• Feststellen/Capslock: Dauergroßschreiben   (Umschalt+Umschalt)
  Zum Lösen der Feststellung nochmals gleiche Kombination
• Feststellen der Ebene 4:                   (Mod4+Mod4) oder (Umschalt+Mod3+Tab)
  Zum Lösen der Feststellung nochmals gleiche Kombination

  HINWEIS: Unter Linux ist es momentan noch nicht möglich die Feststellung
  zu lösen, indem man beide Mods drückt. Man muss dort nur einen drücken!

=== Maustastatursteuerung ===
Die Maustastatursteuerung schaltet man über Shift+Mod4+T1 ein und ebenso wieder aus.
Mit dieser kann man den Mauszeiger über die Tastatur steuern. Dies kann sinnvoll sein, falls
die Maus oder das Touchpad streikt oder keine solches Medium vorhanden ist.
Am besten geeignet ist dazu die Ebene 4 des Keypads (z.B. mit Mod4_Lock). Verzichtet man auf
Markierungen ist auch Ebene 1 des Keypads geeignet.
Des Weiteren kann man die Zahlen auf Ebene 4 des Haupttastaturfelds benutzen, jedoch ist die
Bedienung dort weniger komfortabel.

=== Symbole ===                            
⇞⇟   … Bild auf/Bild ab                  
⇱⇲   … Pos1/Ende                         
⌫ ⌦  … Backspace/Entf                    
⌧    … Esc                               
⎀    … Einf
⇠⇡⇢⇣ … Links/Hoch/Rechts/Runter
♫    … Steht als Symbol für die Kombotaste (Compose)
╌    … Weicher Trennstrich (U+00AD SOFT HYPHEN)
␣    … Leerzeichen (SPACE)
⍽    … Geschütztes Leerzeichen (U+00A0 NO-BREAK SPACE)
¦    … Schmales, geschütztes Leerzeichen (U+202F NARROW NO-BREAK SPACE)
↶    … undo-Funktion

=== Akzenttasten ===
Zu den Akzenten siehe auch
• http://unicode.e-workers.de/
• http://de.wikipedia.org/wiki/Diakritisches_Zeichen
• http://de.wikipedia.org/wiki/Liste_lateinisch-basierter_Alphabete

  <xsl:apply-templates/>


ACHTUNG: „Tote Tasten“ (Tasten zum Erzeugen toter Zeichen – also Zeichen die nicht
gleich erscheinen, sondern nur in Kombination mit einem weiteren Buchstaben) werden
folgendermaßen bedient (Beispiel):
1. Tote Tilde »~« eingeben.
2. Danach »n«.
3. Es erscheint das »ñ«.

TIPP: Mit den toten Tasten Zirkumflex und Querstrich kann man hoch(ˆ)- und tiefgestellte(/) Ziffern erzeugen.

=== Taste mit Bindestrichen, Gedankenstrich usw. ===
Zu den Gedankenstrichen usw. siehe
• http://www.matthias-kammerer.de/SonsTypo3.htm
• http://de.wikipedia.org/wiki/Weicher_Trennstrich

  <xsl:apply-templates/>

=== Dezimaltrennzeichen ===
Das Dezimaltrennzeichen ist auf englischen und südamerikanischen Systemen ein Punkt ».«.
Auf deutschen, französischen, spanischen, schweizerischen und anderen ein Komma »,«.
Siehe auch http://de.wikipedia.org/wiki/Dezimaltrennzeichen

== Ziffern ==
Die Ziffern auf der Ersten Ebene sind die »normalen« Zahlen (also nicht die KP_-Variante),
wogegen für den Ziffernblock auf der vierten Ebene stets die KP_‐Varianten verwendet werden
sollten, um die Vielseitigkeit und Funktionsfähigkeit der NEO‐Tastatur zu gewährleisten.

=== Alle Ebenen – Haupttastatur ===
  <xsl:apply-templates/>

== Ziffernblock ==
Um die Vielseitigkeit und Funktionsfähigkeit der NEO‐Tastatur zu gewährleisten,
sollten für alle Elemente auf dem Keypad wenn möglich die KP_‐Variante verwendet werden!

=== Legende – Ziffernblock ===
┌───────┐ 1 … 1. Ebene (kein Mod)     │ 4 … 4. Ebene (Mod4)
│ 2 4 6 │ 2 … 2. Ebene (Umschalt)     │ 5 … 5. Ebene (Mod3+Umschalt)
│ 1 3 5 │ 3 … 3. Ebene (Mod3)         │ 6 … 6. Ebene (Mod3+Mod4)
└───────┘

=== Rechenzeichen ===
  <xsl:apply-templates/>

=== Alle Ebenen – Ziffernblock ===
  <xsl:apply-templates/>
== Tipp ==
Trägt man unter Linux/Mac/BSD folgende Zeilen in die ~/.bashrc, ~/.zshrc oder
vergleichbares ein, bekommt man anschließend mittels Eingabe von »neo« oder
»num« die aktuelle Belegung in der Konsole angezeigt:
alias num='grep -m 1 -B 15 "┴───────┘"  PFAD_ZUR_DATEI/neo20.txt'
alias neo='grep -m 1 -B 15 "┴──────┘" PFAD_ZUR_DATEI/neo20.txt'
 
Dazu muss »PFAD_ZUR_DATEI« durch den Pfad zu dieser Datei ersetzt werden.

Im Verzeichnis linux/bin sind umfangreichere Skripte mit größerer Funktionalität.

== Zeichenerläuterungen ==
Ξ … Xi, griechischer Majuskel (U039E)
≙ … entspricht (U2259)
Λ … Lambda, griechischer Majuskel (U039B)
ℂ … Menge der komplexen Zahlen (U2102)
Ω … Omega, griechischer Majuskel (U03A9)
√ … Wurzel aus (U221A)
Ψ … Psi, griechischer Majuskel (U03A8)
Γ … Gamma, griechischer Majuskel (U0393)
Φ … Phi, griechischer Majuskel (U03A6)
ℚ … Menge der rationalen Zahlen (U211A)
∘ … Verknüpfungsoperator (U2218)
∮ … Integral über eine geschlossene Kurve (U222E)
∫ … Integral (U222B)
∀ … Allquantor ; für alle (U2200)
∃ … Existenzquantor ; es gibt (U2203)
∈ … Element von (U2208)
Σ … Sigma, griechischer Majuskel (U03A3)
ℕ … Menge der natürlichen Zahlen (U2115)
ℝ … Menge der reellen Zahlen (U211D)
∂ … partielle Ableitung (U2202)
Δ … Delta, griechischer Majuskel (U0394)
∇ … Nablaoperator (Gradient, Divergenz, Rotation) (U2207)
∝ … proportional zu (U221D)
ℑ … Imaginärteil einer komplexen Zahl (U2111)
ℜ … Realteil einer komplexen Zahl (U211C)
ℵ … Kardinalzahlen, Aleph-Symbol (U2135)
Π … Pi, griechischer Majuskel (U03A0)
ℤ … Menge der ganzen Zahlen (U2124)
⇒ … Implikation ; daraus folgt ; hinreichend für (U21D2)
⇔ … Äquivalenzzeichen (U21D4)
⇐ … notwendig für ; nur dann, wenn (U21D0)
Θ … Theta, griechischer Majuskel (U0398)
≡ … identisch (U2261)
□ … Beweisende (qed) (U25A1)
⊙ … direkte Summe ; Vektor aus der Ebene zeigend (U2299)
⊗ … Tensorprodukt ; Vektor in die Ebene zeigend (U2297)
∞ … unendlich (U221E)
∋ … enthält das Element (U220B)
ª … weiblicher Ordinalindikator (2ª) (00AA)
º … männlicher Ordinalindikator (1º) (00BA)

== Hinweise zu Doppelbelegungen in Unicode ==
Griechische Minuskel und Majuskel besitzten in der Regel eine weitere Bedeutung, z.B.
• Δ für Differenz oder Fehler
• Θ für homöopathische Urtinktur
• Γ für Gammafunktion

Einige finden sich darum an mehreren Stellen im Unicode, um (eventuelle) Unterschiede
deutliche machen zu können. Zur Platzersparnis haben wir stets eines (das einfachste
und allgemeinste) Zeichen aufgenommen:
• Ω (U03A9) ; Einheit des Widerstandes Ohm (U2126)
• Σ (U03A3) ; Summenzeichen (U2211)
• Δ (U0394) ; Laplaceoperator (2206) ; Dreieck, symmetrische Differenz (25B3)
• ∇ (U2207) ; Dreieck (U25BD)
• Π (U03A0) ; Produktzeichen ∏ (U220F)
• µ (U03BC) ; SI-Vorsilbe micro (U00B5)

</xsl:template>
</xsl:stylesheet>
