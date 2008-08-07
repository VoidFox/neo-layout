

/********************
 Verzeichnisse      *
*********************
*/
; Setzt den Pfad zu einem tempor�ren Verzeichnis
EnvGet, WindowsEnvTempFolder, TEMP
ResourceFolder = %WindowsEnvTempFolder%\NEO2
FileCreateDir, %ResourceFolder%

; Setzt den Pfad zu den NEO-Anwendungsdateien
EnvGet, WindowsEnvAppDataFolder, APPDATA
ApplicationFolder = %WindowsEnvAppDataFolder%\NEO2
FileCreateDir, %ApplicationFolder%



/******************
 Globale Schalter *
*******************
*/

; Im folgenden gilt (soweit nicht anders angegeben) Ja = 1, Nein = 0:
; Syntaxhinweis: IniRead, Variable, InputFilename, Section, Key [, DefaultValue]


; Sollen die Bilder f�r die Bildschirmtastatur in die compilierte EXE-Datei miteingebunden werden? (Nachteil: gr�ssere Dateigr�sse, Vorteil: Referenz f�r Anf�nger stets einfach verf�gbar)
bildschirmTastaturEinbinden := 1

; Sollen Ebenen 1-4 ignoriert werden (kann z.B. vom dll Treiber �bernommen werden)?
IniRead, ahkTreiberKombi, %ApplicationFolder%\NEO2.ini, Global, ahkTreiberKombi, 0

; Soll der Treiber im Einhandmodus betrieben werden?
IniRead, einHandNeo, %ApplicationFolder%\NEO2.ini, Global, einHandNeo, 0

; Soll der Lernmodus aktiviert werden?
IniRead, lernModus, %ApplicationFolder%\NEO2.ini, Global, lernModus, 0

; Aktivierter Mod4-Lock wird �ber die Rollen-LED des Keybord angezeigt (analog zu CapsLock)
IniRead, UseMod4Light, %ApplicationFolder%\NEO2.ini, Global, UseMod4Light, 1

; Soll Lang-s auf s, s auf � und � auf Mod3+� gelegt (bzw. vertauscht) werden?
IniRead, LangSTastatur, %ApplicationFolder%\NEO2.ini, Global, LangSTastatur, 0



/*************************
 Recourcen-Verwaltung    *
**************************
*/


if(FileExist("ResourceFolder") <> false) {
	; Versuche, alle m�glicherweise in die EXE eingebundenen Dateien zu extrahieren 
	FileInstall, neo.ico, %ResourceFolder%\neo.ico, 1
	FileInstall, neo_disabled.ico, %ResourceFolder%\neo_disabled.ico, 1
	iconBenutzen = 1
	if (bildschirmTastaturEinbinden==1) {
		FileInstall, ebene1.png, %ResourceFolder%\ebene1.png, 1
		FileInstall, ebene2.png, %ResourceFolder%\ebene2.png, 1
		FileInstall, ebene3.png, %ResourceFolder%\ebene3.png, 1
		FileInstall, ebene4.png, %ResourceFolder%\ebene4.png, 1
		FileInstall, ebene5.png, %ResourceFolder%\ebene5.png, 1
		FileInstall, ebene6.png, %ResourceFolder%\ebene6.png, 1
		zeigeBildschirmTastatur = 1
	}
} else {
	MsgBox, "Das Verzeichnis %ResourceFolder% konnte nicht angelegt werden!" ; Diese Zeile dient nur der eventuellen Fehlersuche und sollte eigentlich niemals auftauchen.
}

; Benutze die Dateien auch dann, wenn sie eventuell im aktuellen Verzeichnis vorhanden sind 
if ( FileExist("ebene1.png") && FileExist("ebene2.png") && FileExist("ebene3.png") && FileExist("ebene4.png") && FileExist("ebene5.png") && FileExist("ebene6.png") )
  zeigeBildschirmTastatur = 1
if ( FileExist("neo.ico") && FileExist("neo_disabled.ico") )
  iconBenutzen = 1


/*************************
 lernModus Konfiguration *
 nur relevant wenn       *
 lernModus = 1           *
 Strg+Komma schaltet um  *
**************************
*/
; 0 = aus, 1 = an


; die Nachfolgenden sind n�tzlich um sich die Qwertz-Tasten abzugew�hnen, da alle auf der 4. Ebene vorhanden.
lernModus_std_Return = 0
lernModus_std_Backspace = 0
lernModus_std_PgUp = 0
lernModus_std_PgDn = 0
lernModus_std_Einf = 0
lernModus_std_Entf = 0
lernModus_std_Pos0 = 0
lernModus_std_Ende = 0
lernModus_std_Hoch = 0
lernModus_std_Runter = 0
lernModus_std_Links = 0
lernModus_std_Rechts = 0
lernModus_std_ZahlenReihe = 0



; im folgenden kann man auch noch ein paar Tasten der 4. Ebene deaktivieren
; n�tzlich um sich zu zwingen, richtig zu schreiben
lernModus_neo_Backspace = 0
lernModus_neo_Entf = 1


  

; aus Noras script kopiert:

Process,Priority,,High

#usehook on
#singleinstance force
#LTrim 
  ; Quelltext kann einger�ckt werden, 
  ; msgbox ist trotzdem linksb�ndig

SetTitleMatchMode 2
SendMode Input  

name    = Neo 2.0
enable  = Aktiviere %name%
disable = Deaktiviere %name%

; �berpr�fung auf deutsches Tastaturlayout 
; ----------------------------------------

regread, inputlocale, HKEY_CURRENT_USER, Keyboard Layout\Preload, 1
regread, inputlocalealias, HKEY_CURRENT_USER
     , Keyboard Layout\Substitutes, %inputlocale%
if inputlocalealias <>
   inputlocale = %inputlocalealias%
if inputlocale <> 00000407
{
   suspend   
   regread, inputlocale, HKEY_LOCAL_MACHINE
     , SYSTEM\CurrentControlSet\Control\Keyboard Layouts\%inputlocale%
     , Layout Text
   msgbox, 48, Warnung!, 
     (
     Nicht kompatibles Tastaturlayout:   
     `t%inputlocale%   
     `nDas deutsche QWERTZ muss als Standardlayout eingestellt  
     sein, damit %name% wie erwartet funktioniert.   
     `n�ndern Sie die Tastatureinstellung unter 
     `tSystemsteuerung   
     `t-> Regions- und Sprachoptionen   
     `t-> Sprachen 
     `t-> Details...   `n
     )
   exitapp
}



; Men� des Systray-Icons 
; ----------------------

if (iconBenutzen)
   menu, tray, icon, %ResourceFolder%\neo.ico,,1
menu, tray, nostandard
menu, tray, add, �ffnen, open
   menu, helpmenu, add, About, about
   menu, helpmenu, add, Autohotkey-Hilfe, help
   menu, helpmenu, add
   menu, helpmenu, add, http://&autohotkey.com/, autohotkey
   menu, helpmenu, add, http://www.neo-layout.org/, neo
menu, tray, add, Hilfe, :helpmenu
menu, tray, add
menu, tray, add, %disable%, togglesuspend
menu, tray, default, %disable%
menu, tray, add
menu, tray, add, Edit, edit
menu, tray, add, Reload, reload
menu, tray, add
menu, tray, add, Nicht im Systray anzeigen, hide
menu, tray, add, %name% beenden, exitprogram
menu, tray, tip, %name%


/*
   Variablen initialisieren
*/

Ebene = 1
PriorDeadKey := ""


 


/*
   EinHandNeo
*/
spacepressed := 0
keypressed:= 0

; Reihe 1
gespiegelt_7 = neo_6
gespiegelt_8 = neo_5
gespiegelt_9 = neo_4
gespiegelt_0 = neo_3
gespiegelt_strich = neo_2
gespiegelt_tot2 = neo_1

; Reihe 2
gespiegelt_k = neo_w
gespiegelt_h = neo_c
gespiegelt_g = neo_l
gespiegelt_f = neo_v
gespiegelt_q = neo_x
gespiegelt_sz = neo_tab 
gespiegelt_tot3 = neo_tot1

; Reihe 3
gespiegelt_s = neo_o
gespiegelt_n = neo_e
gespiegelt_r = neo_a
gespiegelt_t = neo_i
gespiegelt_d = neo_u

; Reihe 4
gespiegelt_b = neo_z
gespiegelt_m = neo_p
gespiegelt_komma = neo_�
gespiegelt_punkt = neo_�
gespiegelt_j = neo_�




