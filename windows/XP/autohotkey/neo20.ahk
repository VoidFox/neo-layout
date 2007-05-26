/*
   NEO-Layout - Version vom 25.05.2007
   Mod3 (3./4. Ebene) funktioniert �ber Win+Ctrl, 
    Mod5 (5./6. Ebene) �ber AltGr.
   Zur Umbelegung von Mod3 auf CapsLock und #
    und f�r einen zweiten Mod5 auf <
    verwende neo20-remap.ahk
*/

#usehook on
#singleinstance force
#LTrim 
  ; Quelltext kann einger�ckt werden, 
  ; msgbox ist trotzdem linksb�ndig

SendMode Play	
SetTitleMatchMode 2

name    = NEO-Layout 2.0
enable  = Aktiviere %name%
disable = Deaktiviere %name%


; ANSI-Darstellung von beliebigen Unicode-Zeichen
; -----------------------------------------------
;  - die untenstehende Definition auskommentieren
;  - gew�nschtes Zeichen in die Zwischenablage bef�rdern
;  - ^!u (Control+Alt+U) dr�cken
;  - die ANSI-Darstellung aus der Zwischenablage an die 
;    gew�nschte Stelle ins Skript einf�gen
; Wird ben�tigt f�r Unicode("") und BSUnicode("").
; Alternativ kann SendUnicodeChar(0x002A) verwendet werden,
; braucht aber viel mehr CPU.
/*
^!u::  
   MsgBox, 
     (
     Copy some Unicode text onto the clipboard, 
     then return to this window and press OK to continue.
     )
   Transform, ClipUTF, Unicode
   Clipboard = Transform, Clipboard, Unicode, %ClipUTF%`r`n
   Clipboard = %ClipUTF%
   MsgBox, 
     (
     The clipboard now contains the following line 
     that you can paste into your script. 
     `n%Clipboard%
     )
return
*/


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


; Sondertasten
; ------------

*Esc::Send {Esc} 

*Enter::Send {Enter}   

Space::Send {Space} 
+Space::Send {Space}
#^space::Send {Space}  
#^+space::SendUnicodeChar(0x00A0)   ; gesch�tztes Leerzeichen 
<^>!Space::Send 0
<^>!+Space::SendUnicodeChar(0x2009) ; schmales Leerzeichen

Tab::Send {Tab}
+Tab::Send +{Tab}
#^Tab::Send {Tab}
#^+Tab::Send {Tab}
<^>!Tab::Send {Tab}
<^>!+Tab::Send {Tab}


Backspace::Send {BS}    
+Backspace::Send +{BS}
#^Backspace::Send {BS}    
#^+Backspace::Send {BS}    
<^>!Backspace::Send {BS}    
<^>!+Backspace::Send {BS}    


; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; 1. Ebene
; ---------

^::Unicode("ˆ") ; circumflex, tot

1::
  If A_PriorHotkey = ^          ; circumflex 
    BSUnicode("¹")
  Else
    send 1
return

2::  
  If A_PriorHotkey = ^          ; circumflex 
    BSUnicode("²")
  Else
    send 2
return

3::  
  If A_PriorHotkey = ^          ; circumflex 
    BSUnicode("³")
  Else
    send 3
return

4::send 4
5::send 5
6::send 6
7::send 7
8::send 8
9::send 9
0::send 0
�::send - ; Bind
�::send {�}{space} ; akut, tot

q::sendinput {blind}x

w::
  If A_PriorHotkey = <^>!+^      ; punkt darunter 
    BSUnicode("ṿ")
  Else 
    sendinput {blind}v
Return

e::
  If A_PriorHotkey = <^>!+       ; Schr�gstrich
    BSUnicode("ł")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("ĺ")
  Else If A_PriorHotkey = +^     ; caron 
    BSUnicode("ľ")
  Else If A_PriorHotkey = #^�    ; cedilla
    BSUnicode("ļ")
  Else If A_PriorHotkey = <^>!^  ; Mittenpunkt
    BSUnicode("ŀ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ḷ")
  Else 
    sendinput {blind}l
Return 

r::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ĉ")
  Else If A_PriorHotkey = +^     ; caron
    BSUnicode("č")
  Else If A_PriorHotkey = �      ; akut
    BSUnicode("ć")
  Else If A_PriorHotkey = #^�    ; cedilla
    BSUnicode("ç")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("ċ")
  Else 
    sendinput {blind}c
Return 

t::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ŵ")
  Else
    sendinput {blind}w
Return

z::
  If A_PriorHotkey = #^�         ; cedilla
    BSUnicode("ķ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ḳ")
  Else
    sendinput {blind}k
Return

u::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ĥ")
  Else If A_PriorHotkey = #^+^   ; Querstrich 
    BSUnicode("ħ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("ḣ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ḥ")
  Else sendinput {blind}h
Return

i::
  If A_PriorHotkey = ^          ; circumflex
    BSUnicode("ĝ")
  Else If A_PriorHotkey = #^^   ; brevis
    BSUnicode("ğ")
  Else If A_PriorHotkey = #^�   ; cedilla
    BSUnicode("ģ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("ġ")
  Else sendinput {blind}g
Return

o::
  If A_PriorHotkey = <^>!+      ; durchgestrichen
    BSUnicode("ƒ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("ḟ")
  Else sendinput {blind}f
Return

p::sendinput {blind}q
�::sendinput {blind}�

+::Unicode("˜")    ; tilde, tot 

a::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("û")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("ú")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("ù")
  Else If A_PriorHotkey = #^+    ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = #^++   ; doppelakut 
    BSUnicode("ű")
  Else If A_PriorHotkey = #^^    ; brevis
    BSUnicode("ŭ")
  Else If A_PriorHotkey = ++     ; macron
    BSUnicode("ū")
  Else If A_PriorHotkey = #^+�   ; ogonek
    BSUnicode("ų")
  Else If A_PriorHotkey = <^>!+� ; Ring
    BSUnicode("ů")
  Else If A_PriorHotkey = +      ; tilde
    BSUnicode("ũ")
  Else
    sendinput {blind}u
Return

s::
  If A_PriorHotkey = ^          ; circumflex
    BSUnicode("î")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("í")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("ì")
  Else If A_PriorHotkey = #^+   ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = ++    ; macron
    BSUnicode("ī")
  Else If A_PriorHotkey = #^^   ; brevis
    BSUnicode("ĭ")
  Else If A_PriorHotkey = #^+�  ; ogonek
    BSUnicode("į")
  Else If A_PriorHotkey = +     ; tilde
    BSUnicode("ĩ")
  Else If A_PriorHotkey = <^>!� ; (ohne) punkt dar�ber 
    BSUnicode("ı")
  Else 
    sendinput {blind}i
Return

d::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("â")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("á")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("à")
  Else If A_PriorHotkey = #^+    ; Diaerese
    send {bs}�
  Else If A_PriorHotkey = <^>!+� ; Ring 
    Send {bs}�
  Else If A_PriorHotkey = +      ; tilde
    BSUnicode("ã")
  Else If A_PriorHotkey = #^+�   ; ogonek
    BSUnicode("ą")
  Else If A_PriorHotkey = ++     ; macron
    BSUnicode("ā")
  Else If A_PriorHotkey = #^^    ; brevis
    BSUnicode("ă")
  Else 
    sendinput {blind}a
Return 

f::
  If A_PriorHotkey = ^          ; circumflex
    BSUnicode("ê")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("é")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("è")
  Else If A_PriorHotkey = #^+   ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = #^+�  ; ogonek
    BSUnicode("ę")
  Else If A_PriorHotkey = ++    ; macron
    BSUnicode("ē")
  Else If A_PriorHotkey = #^^   ; brevis
    BSUnicode("ĕ")
  Else If A_PriorHotkey = +^    ; caron
    BSUnicode("ě")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("ė")
  Else 
    sendinput {blind}e
Return 

g::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ô")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("ó")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("ò")
  Else If A_PriorHotkey = #^+    ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = +      ; tilde
    BSUnicode("õ")
  Else If A_PriorHotkey = #^++   ; doppelakut
    BSUnicode("ő")
  Else If A_PriorHotkey = <^>!+  ; Schr�gstrich
    BSUnicode("ø")
  Else If A_PriorHotkey = ++     ; macron
    BSUnicode("ō")
  Else If A_PriorHotkey = #^^    ; brevis 
    BSUnicode("ŏ")
  Else 
    sendinput {blind}o
Return

h::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ŝ")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("ś")
  Else If A_PriorHotkey = +^     ; caron
    BSUnicode("š")
  Else If A_PriorHotkey = #^�    ; cedilla
    BSUnicode("ş")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("ṡ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ṣ")
  Else   
    sendinput {blind}s
Return

j::
  If A_PriorHotkey = �          ; akut
    BSUnicode("ń")
  Else If A_PriorHotkey = +     ; tilde
    BSUnicode("ñ")
  Else If A_PriorHotkey = +^    ; caron
    BSUnicode("ň")
  Else If A_PriorHotkey = #^�   ; cedilla
    BSUnicode("ņ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("ṅ")
  Else
    sendinput {blind}n
Return

k::
  If A_PriorHotkey = �           ; akut 
    BSUnicode("ŕ")
  Else If A_PriorHotkey = +^     ; caron
    BSUnicode("ř")
  Else If A_PriorHotkey = #^�    ; cedilla
    BSUnicode("ŗ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("ṙ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ṛ")
  Else 
    sendinput {blind}r
Return

l::  
  If A_PriorHotkey = +^          ; caron 
    BSUnicode("ť")
  Else If A_PriorHotkey = #^�    ; cedilla
    BSUnicode("ţ")
  Else If A_PriorHotkey = #^+^   ; Querstrich
    BSUnicode("ŧ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("ṫ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ṭ")
  Else 
    sendinput {blind}t
Return

�::
  If A_PriorHotkey = #^+^        ; Querstrich
    BSUnicode("đ")
  Else If A_PriorHotkey = <^>!+  ; Schr�gstrich
    BSUnicode("ð")
  Else If A_PriorHotkey = +^     ; caron
    BSUnicode("ď")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("ḋ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ḍ")
  Else 
    sendinput {blind}d
Return

�::  
  If A_PriorHotkey = #^+       ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("ý")
  Else If A_PriorHotkey = ^    ; circumflex
    BSUnicode("ŷ")
  Else
    sendinput {blind}y
Return

;SC02B (#) wird zu Mod3

;SC056 (<) wird zu Mod5
y::sendinput {blind}�
x::sendinput {blind}�
c::sendinput {blind}�
v::
  If A_PriorHotkey = <^>!�      ; punkt dar�ber 
    BSUnicode("ṗ")
  Else
    sendinput {blind}p
Return

b::
  If A_PriorHotkey = +^         ; caron
    BSUnicode("ž")
  Else If A_PriorHotkey = �     ; akut
    BSUnicode("ź")
  Else If A_PriorHotkey = <^>!� ; punkt dr�ber
    BSUnicode("ż")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("ż")
  Else 
    sendinput {blind}z
Return 

n::
  If A_PriorHotkey = <^>!�      ; punkt dar�ber 
    BSUnicode("ḃ")
  Else 
    sendinput {blind}b
Return

m::
  If A_PriorHotkey = <^>!�       ; punkt dar�ber 
    BSUnicode("ṁ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ṃ")
  Else 
    sendinput {blind}m
Return

,::send `,
.::send .

-::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ĵ")
  Else
    sendinput {blind}j
Return


;2. Ebene (Shift)
;---------
; 

+^::Unicode("ˇ")  ; caron, tot
+1::send �
+2::send �
+3::send �
+4::send $
+5::send �
+6::send �
+7::send �
+8::send �
+9::send �
+0::send �
+�::Unicode("–") ; Ged
+�::send ``{space} 

+q::sendinput {blind}X
+w::
  If A_PriorHotkey = <^>!+^      ; punkt darunter
    BSUnicode("Ṿ")
  Else 
    sendinput {blind}V
Return

+e::
  If A_PriorHotkey = �           ; akut 
    BSUnicode("Ĺ")
  Else If A_PriorHotkey = +^     ; caron 
    BSUnicode("Ľ")
  Else If A_PriorHotkey = #^�    ; cedilla
    BSUnicode("Ļ")
  Else If A_PriorHotkey = <^>!+  ; Schr�gstrich 
    BSUnicode("Ł")
  Else If A_PriorHotkey = <^>!^  ; Mittenpunkt 
    BSUnicode("Ŀ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ḷ")
  Else 
    sendinput {blind}L
return

+r::
  If A_PriorHotkey = ^          ; circumflex 
    BSUnicode("Ĉ")
  Else If A_PriorHotkey = +^    ; caron 
    BSUnicode("Č")
  Else If A_PriorHotkey = �     ; akut 
    BSUnicode("Ć")
  Else If A_PriorHotkey = #^�   ; cedilla 
    BSUnicode("Ç")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ċ")
  Else 
    sendinput {blind}C
Return 

+t::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Ŵ")
  Else
    sendinput {blind}W
Return

+z::  
  If A_PriorHotkey = #^�         ; cedilla 
    BSUnicode("Ķ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ḳ")
  Else
    sendinput {blind}K
Return

+u::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Ĥ")
  Else If A_PriorHotkey = #^+^   ; Querstrich
    BSUnicode("Ħ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ḣ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ḥ")
  Else sendinput {blind}H
Return

+i::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Ĝ") 
  Else If A_PriorHotkey = #^^    ; brevis 
    BSUnicode("Ğ")
  Else If A_PriorHotkey = #^�    ; cedilla 
    BSUnicode("Ģ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ġ")
  Else sendinput {blind}G
Return

+o::
  If A_PriorHotkey = <^>!+       ; durchgestrichen
    BSUnicode("₣")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ḟ")
  Else sendinput {blind}F
Return

+p::sendinput {blind}Q
+�::send SS ; wird versal-�

++::Unicode("ˉ")  ; macron, tot 

+a::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Û")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("Ú")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("Ù")
  Else If A_PriorHotkey = #^+    ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = <^>!+� ; Ring
    BSUnicode("Ů")
  Else If A_PriorHotkey = #^^    ; brevis
    BSUnicode("Ŭ")
  Else If A_PriorHotkey = #^++   ; doppelakut
    BSUnicode("Ű")
  Else If A_PriorHotkey = +^     ; caron 
    BSUnicode("Ů")
  Else If A_PriorHotkey = ++     ; macron
    BSUnicode("Ū")
  Else If A_PriorHotkey = #^^    ; brevis 
    BSUnicode("Ŭ")
  Else If A_PriorHotkey = #^+�   ; ogonek
    BSUnicode("Ų")
  Else If A_PriorHotkey = +      ; tilde
    BSUnicode("Ũ")
  Else
    sendinput {blind}U
Return

+s::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Î")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("Í")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("Ì")
  Else If A_PriorHotkey = #^+    ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = ++     ; macron
    BSUnicode("Ī")
  Else If A_PriorHotkey = #^^    ; brevis 
    BSUnicode("Ĭ")
  Else If A_PriorHotkey = #^+�   ; ogonek
    BSUnicode("Į")
  Else If A_PriorHotkey = +      ; tilde
    BSUnicode("Ĩ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("İ")
  Else 
    sendinput {blind}I
Return

+d::
  If A_PriorHotkey = ^            ; circumflex
    BSUnicode("Â")
  Else If A_PriorHotkey = �       ; akut 
    BSUnicode("Á")
  Else If A_PriorHotkey = +�      ; grave
    BSUnicode("À")
  Else If A_PriorHotkey = #^+     ; Diaerese
    send {bs}�
  Else If A_PriorHotkey = +       ; tilde
    BSUnicode("Ã")
  Else If A_PriorHotkey = <^>!+�  ; Ring 
    Send {bs}�
  Else If A_PriorHotkey = ++      ; macron
    BSUnicode("Ā")
  Else If A_PriorHotkey = #^^     ; brevis 
    BSUnicode("Ă")
  Else If A_PriorHotkey = #^+�    ; ogonek
    BSUnicode("Ą")
  Else 
    sendinput {blind}A
Return 

+f::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Ê")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("É")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("È")
  Else If A_PriorHotkey = #^+    ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = +^     ; caron
    BSUnicode("Ě")
  Else If A_PriorHotkey = ++     ; macron
    BSUnicode("Ē")
  Else If A_PriorHotkey = #^^    ; brevis 
    BSUnicode("Ĕ")
  Else If A_PriorHotkey = #^+�   ; ogonek 
    BSUnicode("Ę")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ė")
  Else 
    sendinput {blind}E
Return 

+g::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Ô")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("Ó")
  Else If A_PriorHotkey = +�     ; grave
    BSUnicode("Ò")
  Else If A_PriorHotkey = <^>!+  ; Schr�gstrich
    BSUnicode("Ø")
  Else If A_PriorHotkey = +      ; tilde
    BSUnicode("Õ")
  Else If A_PriorHotkey = #^++   ; doppelakut
    BSUnicode("Ő")
  Else If A_PriorHotkey = #^+    ; Diaerese
    send {bs}�
  Else If A_PriorHotkey = ++     ; macron 
    BSUnicode("Ō")
  Else If A_PriorHotkey = #^^    ; brevis 
    BSUnicode("Ŏ")
  Else
    sendinput {blind}O
Return

+h::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Ŝ")
  Else If A_PriorHotkey = +^     ; caron
    BSUnicode("Š")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("Ś")
  Else If A_PriorHotkey = #^�    ; cedilla 
    BSUnicode("Ş")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("�")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṣ")
  Else
    sendinput {blind}S
Return

+j::
  If A_PriorHotkey = +^         ; caron
    BSUnicode("Ň")
  Else If A_PriorHotkey = +     ; tilde
    BSUnicode("Ñ")
  Else If A_PriorHotkey = �     ; akut 
    BSUnicode("Ń")
  Else If A_PriorHotkey = #^�   ; cedilla 
    BSUnicode("Ņ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ṅ")
  Else
    sendinput {blind}N
Return

+k::
  If A_PriorHotkey = +^          ; caron
    BSUnicode("Ř")
  Else If A_PriorHotkey = �      ; akut 
    BSUnicode("Ŕ")
  Else If A_PriorHotkey = #^�    ; cedilla 
    BSUnicode("Ŗ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ṙ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṛ")
  Else 
    sendinput {blind}R
Return

+l::
  If A_PriorHotkey = +^          ; caron
    BSUnicode("Ť")
  Else If A_PriorHotkey = #^�    ; cedilla 
    BSUnicode("Ţ")
  Else If A_PriorHotkey = #^+^   ; Querstrich
    BSUnicode("Ŧ")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ṫ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṭ")
  Else 
    sendinput {blind}T
Return


+�::
  If A_PriorHotkey = #^+^        ; Querstrich
    BSUnicode("Đ")
  Else If A_PriorHotkey = <^>!+  ; Schr�gstrich
    BSUnicode("Ð")
  Else If A_PriorHotkey = +^     ; caron 
    BSUnicode("Ď")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ḋ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ḍ")
  Else sendinput {blind}D
Return

+�::  
  If A_PriorHotkey = �           ; akut 
    BSUnicode("Ý")
  Else If A_PriorHotkey = #^+    ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = ^      ; circumflex
    BSUnicode("Ŷ")
  Else
    sendinput {blind}Y
Return

+y::sendinput {blind}�
+x::sendinput {blind}�
+c::sendinput {blind}�

+v::
  If A_PriorHotkey = <^>!�      ; punkt dar�ber 
    BSUnicode("Ṗ")
  Else 
    sendinput {blind}P
Return

+b::  
  If A_PriorHotkey = +^         ; caron  
    BSUnicode("Ž")
  Else If A_PriorHotkey = �     ; akut 
    BSUnicode("Ź")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ż")
  Else
    sendinput {blind}Z
Return

+n::
  If A_PriorHotkey = <^>!�       ; punkt dar�ber 
    BSUnicode("Ḃ")
  Else 
    sendinput {blind}B
Return

+m::
  If A_PriorHotkey = <^>!�       ; punkt dar�ber 
    BSUnicode("Ṁ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṃ")
  Else 
    sendinput {blind}M
Return

+,::return
+.::Unicode("…")  ; ellipse

+-::
  If A_PriorHotkey = ^            ; circumflex
    BSUnicode("Ĵ")
  Else
    sendinput {blind}J
Return


;3. Ebene: Mod3
;(Win+Ctrl)
;----------------

#^^::Unicode("˘")   ; brevis
#^1::return
#^2::return 
#^3::return 
#^4::send � 
#^5::send �  
#^6::send � 
#^7::send � 
#^8::send �
#^9::send �
#^0::send �
#^�::Unicode("—")
#^�::send � ; cedilla

#^q::send @ 
#^w::send _
#^e::send [
#^r::send ]
#^t::send {^}{space} ; untot
#^z::sendraw !
#^u::
  If A_PriorHotkey = #^+^    ; Querstrich
    BSUnicode("≤")
  Else
    send <
return

#^i::
  If A_PriorHotkey = #^+^    ; Querstrich
    BSUnicode("≥")
  Else
    send >
return

#^o::
  If A_PriorHotkey = ^            ; circumflex 
    BSUnicode("≙")
  Else If A_PriorHotkey = +       ; tilde 
    BSUnicode("≅")
  Else If A_PriorHotkey = <^>!+   ; Schr�gstrich 
    BSUnicode("≠")
  Else If A_PriorHotkey = #^+^    ; Querstrich
    BSUnicode("≡")
  Else If A_PriorHotkey = +^      ; caron 
    BSUnicode("≚")
  Else If A_PriorHotkey = <^>!+�  ; ring dr�ber 
    BSUnicode("≗")
  Else If A_PriorHotkey = +1      ; Grad
    BSUnicode("≗")
  Else   
    send `=
Return

#^p::send {&}
#^�::Unicode("ĳ")   ; ij
#^+::Unicode("¨")   ; Diaerese

#^a::send \
#^s::send `/
#^d::sendraw { 
#^f::sendraw } 
#^g::send *
#^h::send ?
#^j::send (
#^k::send )
#^l::send - ; Bind
#^�::send :
#^�::return

#^y::send {#}  
#^x::send $
#^c::send |

#^v::
  If A_PriorHotkey = +    ; tilde
    BSUnicode("≈")
  Else
    sendraw ~ 
Return

#^b::send ``{space} ; untot
#^n::send {+}
#^m::send `% 
#^,::send '
#^.::send "
#^-::send `;



;4. Ebene: Mod3+Shift
;(Win+Ctrl+Shift)
;---------------------

#^+^::send - ; querstrich, tot
#^+1::send �
#^+2::send �
#^+3::send �
#^+4::send � 
#^+5::send � 
#^+6::send � 
#^+7::send � 
#^+8::send � 
#^+9::send � 
#^+0::send � 
#^+�::send � 
#^+�::Unicode("˛") ; ogonek

#^+q::Unicode("ξ") ;xi
#^+w::return
#^+e::Unicode("λ") ;lambda
#^+r::Unicode("χ") ;chi 
#^+t::return
#^+z::Unicode("κ") ;kappa
#^+u::Unicode("ψ") ;psi
#^+i::Unicode("γ") ;gamma
#^+o::Unicode("φ") ;phi
#^+p::return
#^+�::Unicode("Ĳ") ;IJ
#^++::send "        ;doppelakut

#^+a::return
#^+s::Unicode("ι") ;iota 
#^+d::Unicode("α") ;alpha
#^+f::Unicode("ε") ;epsilon
#^+g::Unicode("ω") ;omega 
#^+h::Unicode("σ") ;sigma
#^+j::Unicode("ν") ;nu
#^+k::Unicode("ρ") ;rho
#^+l::Unicode("τ") ;tau
#^+�::Unicode("δ") ;delta
#^+�::Unicode("υ") ;upsilon

#^+y::return
#^+x::return
#^+c::Unicode("η") ;eta
#^+v::Unicode("π") ;pi
#^+b::Unicode("ζ") ;zeta
#^+n::Unicode("β") ;beta
#^+m::Unicode("µ") ;micro, mu w�re μ
#^+,::Unicode("ϑ") ;vartheta?
#^+.::Unicode("θ") ;theta
#^+-::return



;5. Ebene: Mod5
;(AltGr)
;-----------------

<^>!^::Unicode("·")  ; Mittenpunkt, tot
<^>!1::Unicode("⅛") ; 1/8 
<^>!2::return
<^>!3::Unicode("⅜") ; 3/8
<^>!4::Send {PgUp}    ; Prev
<^>!5::Unicode("⅝") ; 5/8
<^>!6::return
<^>!7::Unicode("⅞") ; 7/8
<^>!8::Send /
<^>!9::Send *
<^>!0::Send -
<^>!�::return
<^>!�::Unicode("˙") ; punkt oben dr�ber

<^>!q::return
<^>!w::Send {Backspace}
<^>!e::Send {Up}
<^>!r::Send {Tab}
<^>!t::Send {Insert}
<^>!z::Send �
<^>!u::Send 7
<^>!i::Send 8
<^>!o::Send 9
<^>!p::Send {+}
<^>!�::Unicode("ə") ; schwa
<^>!+::Unicode("/")  ; Schr�gstrich, tot

<^>!a::Send {Home}
<^>!s::Send {Left}
<^>!d::Send {Down}
<^>!f::Send {Right}
<^>!g::Send {End}
<^>!h::Send �
<^>!j::Send 4
<^>!k::Send 5
<^>!l::Send 6
<^>!�::Send `,
<^>!�::Send �         ; thorn


<^>!y::Send {Esc}
<^>!x::Send {Del}
<^>!c::Send {PgDn}    ; Next
<^>!v::Send {Enter}
<^>!b::return
<^>!n::Unicode("∞") ;infty
<^>!m::Send 1
<^>!,::Send 2
<^>!.::Send 3
<^>!-::Send .


;6. Ebene: Mod5+Shift
;(AltGr+Shift)
;-----------------------

<^>!+^::Send .         ; punkt darunter
<^>!+1::return
<^>!+2::return
<^>!+3::return
<^>!+4::Send +{Prev}
<^>!+5::Unicode("⇒") ; Implikation
<^>!+6::Unicode("⇔") ; �quivalenz
<^>!+7::return
<^>!+8::Unicode("∃") ; Existenzquantor
<^>!+9::Unicode("∀") ; Allquantor
<^>!+0::Send �
<^>!+�::Unicode("∨") ; logisch oder
<^>!+�::Unicode("˚")  ; ring obendrauf

<^>!+q::Unicode("Ξ")  ; Xi
<^>!+w::Unicode("Λ")  ; Lambda
<^>!+e::Send +{Up}
<^>!+r::Send +{Tab} 
<^>!+t::Send +{Insert}
<^>!+z::Send �
<^>!+u::Unicode("Ψ")  ; Phi
<^>!+i::Unicode("Γ")  ; Gamma
<^>!+o::Unicode("Φ")  ; Psi
<^>!+p::Unicode("∧") ; logisches Und
<^>!+�::Unicode("Ə")  ; Schwa
<^>!++::Unicode("ˏ")  ; komma drunter, tot 

<^>!+a::Send +{Home}
<^>!+s::Send +{Left}
<^>!+d::Send +{Down}
<^>!+f::Send +{Right}
<^>!+g::Send +{End}
<^>!+h::Unicode("Σ")  ; Sigma
<^>!+j::Unicode("№") ; No
<^>!+k::Unicode("®")  ; (R)
<^>!+l::Unicode("™") ; TM
<^>!+�::Unicode("Δ")  ; Delta
<^>!+�::Send �         ; Thorn 

<^>!+y::return
<^>!+x::Unicode("∫") ; Int
<^>!+c::Send +{PgDn}
<^>!+v::Unicode("Π")  ; Pi
<^>!+b::Unicode("Ω")  ; Omega
<^>!+n::Unicode("•") ; bullet
<^>!+,::Unicode("√") ; sqrt
<^>!+.::Unicode("Θ")  ; Theta 
<^>!+-::Unicode("∇") ; Nabla



;Strg/Ctrl
;---------

^1::send ^1
^2::send ^2
^3::send ^3
^4::send ^4
^5::send ^5
^6::send ^6
^7::send ^7
^8::send ^8
^9::send ^9
^0::send ^0
^�::send ^-

^q::send ^x
^w::send ^v
^e::send ^l
^r::send ^c
^t::send ^w
^z::send ^k
^u::send ^h
^i::send ^g
^o::send ^f
^p::send ^q
^�::send ^�
^+::send ^{+} ;z.B. Firefox Schrift gr��er

^a::send ^u
^s::send ^i
^d::send ^a
^f::send ^e
^g::send ^o
^h::send ^s
^j::send ^n
^k::send ^r
^l::send ^t
^�::send ^d
^�::send ^y


^y::send ^�
^x::send ^�
^c::send ^�
^v::send ^p
^b::send ^z
^n::send ^b
^m::send ^m
^-::send ^- ;z.B. Firefox Schrift kleiner


;Alt-Ebene
;---------

<!1::send {altdown}1
<!2::send {altdown}2
<!3::send {altdown}3
<!4::send {altdown}4
<!5::send {altdown}5
<!6::send {altdown}6
<!7::send {altdown}7
<!8::send {altdown}8
<!9::send {altdown}9
<!0::send {altdown}0

<!q::send {altdown}x
<!w::send {altdown}v
<!e::send {altdown}l
<!r::send {altdown}c
<!t::send {altdown}w
<!z::send {altdown}k
<!u::send {altdown}h
<!i::send {altdown}g
<!o::send {altdown}f
<!p::send {altdown}q
<!�::send {altdown}�

<!a::send {altdown}u
<!s::send {altdown}i
<!d::send {altdown}a
<!f::send {altdown}e
<!g::send {altdown}o
<!h::send {altdown}s
<!j::send {altdown}n
<!k::send {altdown}r
<!l::send {altdown}t
<!�::send {altdown}d
<!�::send {altdown}y

<!y::send {altdown}�
<!x::send {altdown}�
<!c::send {altdown}�
<!v::send {altdown}p
<!b::send {altdown}z
<!n::send {altdown}b
<!m::send {altdown}m
<!-::send {altdown}j


;Win-Ebene
;---------

#1::sendevent #1
#2::sendevent #2
#3::sendevent #3
#4::sendevent #4
#5::sendevent #5
#6::sendevent #6
#7::sendevent #7
#8::sendevent #8
#9::sendevent #9
#0::sendevent #0
#�::sendevent #-

#q::sendevent #x
#w::sendevent #v

#e::
  Run,%A_WinDir%\System32\Rundll32.exe User32.dll`,LockWorkStation 
  return
  ;sendevent #l  

#r::sendevent #c
#t::sendevent #w
#z::sendevent #k
#u::sendevent #h
#i::sendevent #g
#o::sendevent #f
#p::sendevent #q
#�::sendevent #�

#a::sendevent #u
#s::sendevent #i
#d::sendevent #a
#f::sendevent #e
#g::sendevent #o
#h::sendevent #s
#j::sendevent #n
#k::sendevent #r
#l::sendevent #t

#�:: ;  sendevent #d
  FileAppend,
    (
    [Shell]
    Command=2
    [Taskbar]
    Command=ToggleDesktop
    ), DRT.scf
  Run DRT.scf
  FileDelete, DRT.scf
Return 

#�::sendevent #y

#y::sendevent #�
#x::sendevent #�
#c::sendevent #�
#v::sendevent #p
#b::sendevent #z
#n::sendevent #b
#m::sendevent #m
#-::sendevent #j


;Strg-Shift-Ebene
;-----------------

^+1::send ^+1
^+2::send ^+2
^+3::send ^+3
^+4::send ^+4
^+5::send ^+5
^+6::send ^+6
^+7::send ^+7
^+8::send ^+8
^+9::send ^+9
^+0::send ^+0

^+q::send ^+x
^+w::send ^+v
^+e::send ^+l
^+r::send ^+c
^+t::send ^+w
^+z::send ^+k
^+u::send ^+h
^+i::send ^+g
^+o::send ^+f
^+p::send ^+q
^+�::send ^+�

^+a::send ^+u
^+s::send ^+i
^+d::send ^+a
^+f::send ^+e
^+g::send ^+o
^+h::send ^+s
^+j::send ^+n
^+k::send ^+r
^+l::send ^+t
^+�::send ^+d
^+�::send ^+y


^+y::send ^+�
^+x::send ^+�
^+c::send ^+�
^+v::send ^+p
^+b::send ^+z
^+n::send ^+b
^+m::send ^+m
^+-::send ^+j


; -----------------------------------------
; Nummernblock
; -----------------
;
; 1. Ebene
; NumLock On
; --> Zahlenblock
; ------------------
;
; 2. Ebene
; NumLock Off 
; oder NumLock On + Shift
; --> Cursortasten
; -----------------

; 3. Ebene
; NumLock on + Mod3
; --> Pfeile
; -----------------

#^NumpadDiv::send �
#^NumpadMult::send �
#^NumpadSub::send -
#^NumpadAdd::send �
#^NumpadEnter::Unicode("≠") ; neq

#^Numpad7::return
#^Numpad8::Unicode("↑")     ; uparrow
#^Numpad9::return
#^Numpad4::Unicode("←")     ; leftarrow
#^Numpad5::send �
#^Numpad6::Unicode("→")     ; rightarrow
#^Numpad1::return
#^Numpad2::Unicode("↓")     ; downarrow
#^Numpad3::return
#^Numpad0::send `%
#^NumPadDot::send .




; ---------------------------
; 4. Ebene
; NumLock off + Mod3 + Shift
; --> Br�che
; ---------------------------

#^+NumpadDiv::Unicode("∕")   ; slash
#^+NumpadMult::Unicode("⋅")  ; cdot
#^+NumpadSub::return
#^+NumpadAdd::Unicode("∓")   ; -+
#^+NumpadEnter::Unicode("≈") ; approx

#^+NumpadHome::Unicode("≪")  ; ll
#^+NumpadUp::Unicode("∩")    ;
#^+NumpadPgUp::Unicode("≫")  ; gg
#^+NumpadLeft::Unicode("⊂")  ;
#^+NumpadClear::Unicode("∊") ;
#^+NumpadRight::Unicode("⊃") ;
#^+NumpadEnd::Unicode("≤")   ; leq
#^+NumpadDown::Unicode("∪")  ;
#^+NumpadPgDn::Unicode("≥")  ; geq
#^+NumpadIns::send � 
#^+NumPadDel::send `,



; ------------------------------
; 5. Ebene
; NumLock on + Mod5 
; --> Br�che (genau wie Ebene 4)
; ------------------------------


<^>!NumpadDiv::Unicode("∕")   ; slash
<^>!NumpadMult::Unicode("⋅")  ; cdot
<^>!NumpadSub::return
<^>!NumpadAdd::Unicode("∓")   ; -+
<^>!NumpadEnter::Unicode("≈") ; approx


<^>!Numpad7::Unicode("≪")  ; ll
<^>!Numpad8::Unicode("∩")  ;
<^>!Numpad9::Unicode("≫")  ; gg
<^>!Numpad4::Unicode("⊂")  ;
<^>!Numpad5::Unicode("∊")  ;
<^>!Numpad6::Unicode("⊃")  ;
<^>!Numpad1::Unicode("≤")  ; leq
<^>!Numpad2::Unicode("∪")  ;
<^>!Numpad3::Unicode("≥")  ; geq
<^>!Numpad0::send � 
<^>!NumPadDot::send `,


; ------------------------------------

Unicode(code)
   {
   saved_clipboard := ClipboardAll
   Transform, Clipboard, Unicode, %code%
   send ^v
   Clipboard := saved_clipboard
   }

BSUnicode(code)
   {
   saved_clipboard := ClipboardAll
   Transform, Clipboard, Unicode, %code%
   send {bs}^v
   Clipboard := saved_clipboard
   }

SendUnicodeChar(charCode)
   {
   VarSetCapacity(ki, 28 * 2, 0)

   EncodeInteger(&ki + 0, 1)
   EncodeInteger(&ki + 6, charCode)
   EncodeInteger(&ki + 8, 4)
   EncodeInteger(&ki +28, 1)
   EncodeInteger(&ki +34, charCode)
   EncodeInteger(&ki +36, 4|2)

   DllCall("SendInput", "UInt", 2, "UInt", &ki, "Int", 28)
   }

EncodeInteger(ref, val)
   {
   DllCall("ntdll\RtlFillMemoryUlong", "Uint", ref, "Uint", 4, "Uint", val)
   } 


; ------------------------------------

togglesuspend:
   if state <>
   {
      state =
      menu, tray, rename, %enable%, %disable%
   }
   else
   {
      state = : Deaktiviert
      menu, tray, rename, %disable%, %enable%
   }

   menu, tray, tip, %name%%state%
   suspend
return


help:
   Run, %A_WinDir%\hh mk:@MSITStore:autohotkey.chm
return


about:
   msgbox, 64, %name%, 
   (
   %name% 
   `nDas NEO-Layout ersetzt das �bliche deutsche 
   Tastaturlayout mit der Alternative NEO, 
   beschrieben auf http://www.neo-layout.org/. 
   `nDazu sind keine Administratorrechte n�tig. 
   `nWenn Autohotkey aktiviert ist, werden alle Tastendrucke 
   abgefangen und statt dessen eine �bersetzung weitergeschickt. 
   `nDies geschieht transparent f�r den Anwender, 
   es muss nichts installiert werden. 
   `nDie Zeichen�bersetzung kann leicht �ber das Icon im 
   Systemtray deaktiviert werden.  `n
   )
return


neo:
   run http://www.neo-layout.org/
return

autohotkey:
   run http://autohotkey.com/
return

open:
   ListLines ; shows the Autohotkey window
return

edit:
   edit
return

reload:
   Reload
return

hide:
   menu, tray, noicon
return

exitprogram:
   exitapp
return