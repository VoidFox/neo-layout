# Erzeuge Konfiguration in .config
#
# Aufruf erfolgt über Makefile mittels 'make config'
#
# Autor: hcw@gmx.de

#
# Kommandozeilenparameter: Liste der verfügbaren Module
MODULES=$*

# Pfade und Dateinamen
CONFFILE=.config
MODPATH=./src
MODSUFFIX=.module

[ -e $CONFFILE ] || { echo $CONFFILE fehlt; exit 1; }

#
# verfügbare Module auslesen und Kurzbeschreibung anzeigen
#

selprompt=
PS3="Gewählte Module sind mit '+' gekennzeichnet.
Auswahl (angegebene Ziffer oder 0 für Ende) > "

echo Verfügbare Module für XCompose:
for i in ${MODULES}; do
    sed -n "
/^#configinfo[ \t]*/{
    s//$i          /
    s/^\(.\{10\}\) */\1/
    p;q
}

\${
    s/.*/$i          - ohne Beschreibung/
    s/^\(.\{10\}\) */\1/
    p
}" ${MODPATH}/${i}${MODSUFFIX}

    if grep -q $i $CONFFILE; then
	selprompt="${selprompt} ${i}+ ";
    else
	selprompt="${selprompt} ${i} ";
    fi
done
echo

#
# Nutzereingabe
#

again=true

while ${again} ; do
    again=false
    select MOD in ${selprompt}; do
	case "X$MOD" in
	    X)
		if [ "X$REPLY" != "X0" ]; then again=true; fi ;;
	    *)
		again=true
		selprompt=`echo $selprompt | sed "s/$MOD/$MOD+/;s/++//"` ;;
	esac
        break
    done
done

#
# Configfile erzeugen
#

echo $selprompt | sed '
s/$/ /            # letztes Wort mit Leerzeichen abschließen
s/[^ +]\+ / /g    # Wörter ohne plus am Ende löschen
s/+//g            # alle Pluszeichen löschen
s/^ *//           # Leerzeichen am Anfang und Ende löschen
s/ *$//           # Leerzeichen am Anfang und Ende löschen
s/ \+/_/g         # Leerzeichen normalisieren
s/^/USER_XCOMPOSE = XCompose_/
' > $CONFFILE

echo
echo Gewählte Module:
cat $CONFFILE

grep -q base $CONFFILE || echo "*** Warnung: Modul 'base' wurde nicht gewählt."

echo
echo "Weiter mit 'make' bzw. 'make install'"
