/*
   NEO-Layout - Version vom 08.05.2007
   Mod3 (3./4. Ebene) funktioniert �ber Win+Ctrl, 
    Mod5 (5./6. Ebene) �ber AltGr.
   Zur Umbelegung von Mod3 auf CapsLock und #
    und f�r einen zweiten Mod5 auf <
    verwende neo20-remap.ahk
*/

;#InstallKeybdHook
#usehook on
#singleinstance force
#LTrim 
  ; Quelltext kann einger�ckt werden, 
  ; msgbox ist trotzdem linksb�ndig

SendMode InputThenPlay	

name    = NEO-Layout 2.0
enable  = Aktiviere %name%
disable = Deaktiviere %name%

; ToDo
; --------
; nobreakspace und schmales Leerzeichen


; ANSI-Darstellung von beliebigen Unicode-Zeichen
; -----------------------------------------------
; (ben�tigt f�r MyUTF_String):
;  - die untenstehende Definition auskommentieren
;  - gew�nschtes Zeichen in die Zwischenablage bef�rdern
;  - ^!u (Control+Alt+U) dr�cken
;  - die ANSI-Darstellung aus der Zwischenablage an die 
;    gew�nschte Stelle ins Skript einf�gen
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
     `n�ndere die Tastatureinstellung unter 
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
menu, tray, add, %disable%, toggleneo
menu, tray, default, %disable%
menu, tray, add
menu, tray, add, Edit, edit
menu, tray, add, Reload, reload
menu, tray, add
menu, tray, add, Nicht im Systray anzeigen, hide
menu, tray, add, %name% beenden, exitprogram
menu, tray, tip, %name%



;1. Ebene
;---------

^::send {^} ; circumflex, tot
1::send 1
2::send 2
3::send 3
4::send 4
5::send 5
6::send 6
7::send 7
8::send 8
9::send 9
0::send 0
�::send - 
�::send {�} ; akut, tot

q::send x

w::
  If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ṿ")
  Else 
    send v
Return

e::
  If A_PriorHotkey = <^>!+ ; Schr�gstrich
    BSUnicode("ł")
  Else If A_PriorHotkey = � ; akut 
    BSUnicode("ĺ")
  Else If A_PriorHotkey = +^ ; caron 
    BSUnicode("ľ")
  Else If A_PriorHotkey = #^� ; cedilla
    BSUnicode("ļ")
  Else If A_PriorHotkey = <^>!^ ; Mittenpunkt
    BSUnicode("ŀ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ḷ")
  Else 
    send l
Return 

r::
  If A_PriorHotkey = ^ ; circumflex
    BSUnicode("ĉ")
  Else If A_PriorHotkey = +^ ; caron
    BSUnicode("č")
  Else If A_PriorHotkey = � ; akut
    BSUnicode("ć")
  Else If A_PriorHotkey = #^� ; cedilla
    BSUnicode("ç")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("ċ")
  Else 
    Send c
Return 

t::
  If A_PriorHotkey = ^ ; circumflex
    BSUnicode("ŵ")
  Else
    send w
Return

z::
  If A_PriorHotkey = #^� ; cedilla
    BSUnicode("ķ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ḳ")
  Else
    send k
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
  Else send h
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
  Else send g
Return

o::
  If A_PriorHotkey = <^>!+      ; durchgestrichen
    BSUnicode("ƒ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("ḟ")
  Else send f
Return

p::send q
�::send �
+::send ~ ; tilde, soll tot

a::
  If A_PriorHotkey = #^+         ; Diaerese
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
    send u
Return

s::
  If A_PriorHotkey = #^+        ; Diaerese
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
    Send i
Return

d::
  If A_PriorHotkey = #^+         ; Diaerese
    Send {bs}�
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
    Send a
Return 

f::
  If A_PriorHotkey = #^+        ; Diaerese
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
    Send e
Return 

g::
  If A_PriorHotkey = #^+         ; Diaerese
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
    send o
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
    send s
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
    send n
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
    send r
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
    send t
Return

�::
  If A_PriorHotkey = #^+^        ; Querstrich
    BSUnicode("đ")
  Else If A_PriorHotkey = +^     ; caron
    BSUnicode("ď")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("ḋ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ḍ")
  Else 
    send d
Return

�::  
  If A_PriorHotkey = #^+       ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = ^    ; circumflex
    BSUnicode("ŷ")
  Else
    send y
Return

;SC02B (#) wird zu AltGr

;SC056 (<) wird zu Mod5
y::send �
x::send �
c::send �
v::
  If A_PriorHotkey = <^>!�      ; punkt dar�ber 
    BSUnicode("ṗ")
  Else
    send p
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
    Send z
Return 

n::
  If A_PriorHotkey = <^>!�      ; punkt dar�ber 
    BSUnicode("ḃ")
  Else 
    send b
Return

m::
  If A_PriorHotkey = <^>!�       ; punkt dar�ber 
    BSUnicode("ṁ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("ṃ")
  Else 
    send m
Return

,::send `,
.::send .

-::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ĵ")
  Else
    send j
Return

Space::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("ˆ")
  Else If A_PriorHotkey = +      ; tilde 
    BSUnicode("˜")
  Else
    Send {Space}
Return

Enter::Send {Enter}
Esc::Send {Esc}


;2. Ebene (Shift)
;---------

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
+�::send `` 

+q::send X
+w::
  If A_PriorHotkey = <^>!+^      ; punkt darunter
    BSUnicode("Ṿ")
  Else 
    send V
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
    send L
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
    Send C
Return 

+t::
  If A_PriorHotkey = ^           ; circumflex
    BSUnicode("Ŵ")
  Else
    send W
Return

+z::  
  If A_PriorHotkey = #^�         ; cedilla 
    BSUnicode("Ķ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ḳ")
  Else
    send K
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
  Else send H
Return

+i::
  If A_PriorHotkey = ^          ; circumflex
    BSUnicode("Ĝ")
  Else If A_PriorHotkey = #^^   ; brevis 
    BSUnicode("Ğ")
  Else If A_PriorHotkey = #^�   ; cedilla 
    BSUnicode("Ģ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ġ")
  Else send G
Return

+o::
  If A_PriorHotkey = <^>!+       ; durchgestrichen
    BSUnicode("₣")
  Else If A_PriorHotkey = <^>!�  ; punkt dar�ber 
    BSUnicode("Ḟ")
  Else send F
Return

+p::send Q
+�::send �

++::Unicode("ˉ")  ; macron, tot 

+a::
  If A_PriorHotkey = #^+         ; Diaerese
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
    send U
Return

+s::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = ++ ; macron
    BSUnicode("Ī")
  Else If A_PriorHotkey = #^^ ; brevis 
    BSUnicode("Ĭ")
  Else If A_PriorHotkey = #^+� ; ogonek
    BSUnicode("Į")
  Else If A_PriorHotkey = + ; tilde
    BSUnicode("Ĩ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("İ")
  Else 
    Send I
Return

+d::
  If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = + ; tilde
    BSUnicode("Ã")
  Else If A_PriorHotkey = <^>!+� ; Ring 
    Send {bs}�
  Else If A_PriorHotkey = ++ ; macron
    BSUnicode("Ā")
  Else If A_PriorHotkey = #^^ ; brevis 
    BSUnicode("Ă")
  Else If A_PriorHotkey = #^+� ; ogonek
    BSUnicode("Ą")
  Else 
    Send A
Return 

+f::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = +^ ; caron
    BSUnicode("Ě")
  Else If A_PriorHotkey = ++ ; macron
    BSUnicode("Ē")
  Else If A_PriorHotkey = #^^ ; brevis 
    BSUnicode("Ĕ")
  Else If A_PriorHotkey = #^+� ; ogonek 
    BSUnicode("Ę")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ė")
  Else 
    Send E
Return 

+g::
  If A_PriorHotkey = <^>!+ ; Schr�gstrich
    BSUnicode("Ø")
  Else If A_PriorHotkey = + ; tilde
    BSUnicode("Õ")
  Else If A_PriorHotkey = #^++ ; doppelakut
    BSUnicode("Ő")
  Else If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = ++ ; macron 
    BSUnicode("Ō")
  Else If A_PriorHotkey = #^^ ; brevis 
    BSUnicode("Ŏ")
  Else
    send O
Return

+h::
  If A_PriorHotkey = ^ ; circumflex
    BSUnicode("Ŝ")
  Else If A_PriorHotkey = +^ ; caron
    BSUnicode("Š")
  Else If A_PriorHotkey = � ; akut 
    BSUnicode("Ś")
  Else If A_PriorHotkey = #^� ; cedilla 
    BSUnicode("Ş")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("�")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṣ")
  Else
    send S
Return

+j::
  If A_PriorHotkey = +^ ; caron
    BSUnicode("Ň")
  Else If A_PriorHotkey = + ; tilde
    BSUnicode("Ñ")
  Else If A_PriorHotkey = � ; akut 
    BSUnicode("Ń")
  Else If A_PriorHotkey = #^� ; cedilla 
    BSUnicode("Ņ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ṅ")
  Else
    send N
Return

+k::
  If A_PriorHotkey = +^ ; caron
    BSUnicode("Ř")
  Else If A_PriorHotkey = � ; akut 
    BSUnicode("Ŕ")
  Else If A_PriorHotkey = #^� ; cedilla 
    BSUnicode("Ŗ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ṙ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṛ")
  Else 
    send R
Return

+l::
  If A_PriorHotkey = +^ ; caron
    BSUnicode("Ť")
  Else If A_PriorHotkey = #^� ; cedilla 
    BSUnicode("Ţ")
  Else If A_PriorHotkey = #^+^ ; Querstrich
    BSUnicode("Ŧ")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ṫ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṭ")
  Else 
    send T
Return


+�::
  If A_PriorHotkey = #^+^ ; Querstrich
    BSUnicode("Đ")
  Else If A_PriorHotkey = +^ ; caron 
    BSUnicode("Ď")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ḋ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ḍ")
  Else send D
Return

+�::  
  If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = ^ ; circumflex
    BSUnicode("Ŷ")
  Else
    send Y
Return

+y::send �
+x::send �
+c::send �

+v::
  If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ṗ")
  Else 
    send P
Return

+b::  
  If A_PriorHotkey = +^ ; caron  
    BSUnicode("Ž")
  Else If A_PriorHotkey = � ; akut 
    BSUnicode("Ź")
  Else If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ż")
  Else
    send Z
Return

+n::
  If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ḃ")
  Else 
    send B
Return

+m::
  If A_PriorHotkey = <^>!� ; punkt dar�ber 
    BSUnicode("Ṁ")
  Else If A_PriorHotkey = <^>!+^ ; punkt darunter 
    BSUnicode("Ṃ")
  Else 
    send M
Return

+,::send `;
+.::send :

+-::
  If A_PriorHotkey = ^ ; circumflex
    BSUnicode("Ĵ")
  Else
    send J
Return


;3. Ebene: Mod3
;(Win+Ctrl)
;----------------

#^^::Unicode("˘") ; brevis, soll tot
#^1::Unicode("¬")
#^2::send {^}{space} 
#^3::send 3 
#^4::send � 
#^5::send �  
#^6::send � 
#^7::send � 
#^8::send �
#^9::send �
#^0::send �
#^�::Unicode("—")
#^�::send � ; cedilla, soll tot

#^q::send @ 
#^w::send _
#^e::send [
#^r::send ]
#^t::send {^}{space} ; untot
#^z::sendraw !
#^u::send <
#^i::send >
#^o::send `=
#^p::send `;
#^�::Unicode("ĳ")  ;ij
#^+::Unicode("¨") ; Diaerese, soll tot

#^a::send \
#^s::send `/
#^d::sendraw { 
#^f::sendraw } 
#^g::send *
#^h::send ?
#^j::send (
#^k::send )
#^l::send -
#^�::send :
#^�::send y

#^y::sendraw ~ 
#^x::send $
#^c::send |
#^v::send {#}
#^b::send ``{space} ; untot
#^n::send {+}
#^m::send `% 
#^,::send {&}
#^.::send "
#^-::send '



;4. Ebene: Mod3+Shift
;(Win+Ctrl+Shift)
;---------------------

#^+^::send - 
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
#^+�::Unicode("˛") ; ogonek, soll tot

#^+q::Unicode("ξ")  ;xi
#^+w::send v
#^+e::Unicode("λ")  ;lambda
#^+r::Unicode("χ")  ;chi 
#^+t::send w
#^+z::Unicode("κ") ;kappa
#^+u::Unicode("ψ") ;psi
#^+i::Unicode("γ") ;gamma
#^+o::Unicode("φ") ;phi
#^+p::send q
#^+�::Unicode("Ĳ") ;IJ
#^++::send " ;doppelakut, soll tot

#^+a::send u
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

#^+y::send �
#^+x::send �
#^+c::Unicode("η") ;eta
#^+v::Unicode("π") ;pi
#^+b::Unicode("ζ") ;zeta
#^+n::Unicode("β") ;beta
#^+m::Unicode("μ") ;mu
#^+,::Unicode("ϑ") ;vartheta?
#^+.::Unicode("θ") ;theta
#^+-::send j

;#^+space::    ; gesch�tztes Leerzeichen




;5. Ebene: Mod5
;(AltGr)
;-----------------

<^>!^::Unicode("·") ; Mittenpunkt, tot mit l und L
<^>!4::Send {PgUp} ;Prev
<^>!8::Send /
<^>!9::Send *
<^>!0::Send -
<^>!�::Unicode("ð") ; eth
<^>!�::Unicode("˙") ; punkt oben dr�ber, soll tot

<^>!q::Send {Esc}
<^>!w::Send {Backspace}
<^>!e::Send {Up}
<^>!t::Send {Insert}
<^>!z::Send �
<^>!u::Send 7
<^>!i::Send 8
<^>!o::Send 9
<^>!p::Send {+}
<^>!�::Unicode("ə") ; ?
<^>!+::Unicode("/") ; Schr�gstrich, soll tot 

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
<^>!�::Send � ; thorn


<^>!y::Send {Tab}
<^>!x::Send {Del}
<^>!c::Send {PgDn} ;Next
<^>!n::Send �
<^>!m::Send 1
<^>!,::Send 2
<^>!.::Send 3
<^>!-::Send .

<^>!Space::Send 0
;<^>!SC138::Send {NumpadDot} 
  ; geht nicht, weil sonst AltGr nur noch , macht



;6. Ebene: Mod5+Shift
;(AltGr+Shift)
;-----------------------

<^>!+^::Send . ; punkt darunter
<^>!+4::Send +{Prev}
<^>!+�::Unicode("Ð") ; Eth
<^>!+�::Unicode("˚") ; ring obendrauf

<^>!+q::Unicode("Ξ") ; Xi
<^>!+w::Unicode("Λ") ; Lambda
<^>!+e::Send +{Up}
<^>!+r::Send � 
<^>!+t::Send +{Insert}
<^>!+u::Unicode("Ψ") ; Phi
<^>!+i::Unicode("Γ") ; Gamma
<^>!+o::Unicode("Φ") ; Psi
<^>!+�::Unicode("Ə") ; ?
<^>!++::Unicode("ˏ") ; komma drunter, soll tot 

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

<^>!+y::Send +{Tab}
<^>!+c::Send +{PgDn}
<^>!+v::Unicode("Π") ; Pi
<^>!+b::Unicode("Ω") ; Omega
<^>!+.::Unicode("Θ") ; Theta 



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
^-::send ^j


;Alt-Ebene
;---------

<!1::send !1
<!2::send !2
<!3::send !3
<!4::send !4
<!5::send !5
<!6::send !6
<!7::send !7
<!8::send !8
<!9::send !9
<!0::send !0

<!q::send !x
<!w::send !v
<!e::send !l
<!r::send !c
<!t::send !w
<!z::send !k
<!u::send !h
<!i::send !g
<!o::send !f
<!p::send !q
<!�::send !�

<!a::send !u
<!s::send !i
<!d::send !a
<!f::send !e
<!g::send !o
<!h::send !s
<!j::send !n
<!k::send !r
<!l::send !t
<!�::send !d
<!�::send !y

<!y::send !�
<!x::send !�
<!c::send !�
<!v::send !p
<!b::send !z
<!n::send !b
<!m::send !m
<!-::send !j


;Win-Ebene
;---------

#1::send #1
#2::send #2
#3::send #3
#4::send #4
#5::send #5
#6::send #6
#7::send #7
#8::send #8
#9::send #9
#0::send #0
#�::send #-

#q::send #x
#w::send #v

#e::  
  Run,%A_WinDir%\System32\Rundll32.exe User32.dll`,LockWorkStation 
  return
   ; #e::send #l  funktioniert nicht, Computer wird nicht gesperrt
   ; http://www.autohotkey.com/forum/viewtopic.php?p=66937#66937

#r::send #c
#t::send #w
#z::send #k
#u::send #h
#i::send #g
#o::send #f
#p::send #q
#�::send #�

#a::send #u
#s::send #i
#d::send #a
#f::send #e
#g::send #o
#h::send #s
#j::send #n
#k::send #r
#l::send #t
#�::send #d
#�::send #y

#y::send #�
#x::send #�
#c::send #�
#v::send #p
#b::send #z
#n::send #b
#m::send #m
#-::send #j

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
#^NumpadEnter::Unicode("�") ; neq

#^Numpad7::Unicode("⅞")   ; 7/8
#^Numpad8::Unicode("↑")   ; uparrow
#^Numpad9::Unicode("⅜")   ; 3/8
#^Numpad4::Unicode("�?")   ; leftarrow
#^Numpad5::send �
#^Numpad6::Unicode("→")   ; rightarrow
#^Numpad1::send � 
#^Numpad2::Unicode("↓")   ; downarrow
#^Numpad3::send �
#^Numpad0::send `%
#^NumPadDot::send .




; ---------------------------
; 4. Ebene
; NumLock off + Mod3 + Shift
; --> Br�che
; ---------------------------

#^+NumpadDiv::Unicode("∕")   ; slash
#^+NumpadMult::Unicode("⋅")  ; cdot
#^+NumpadSub::send -           ; eig. unbelegt
#^+NumpadAdd::Unicode("∓")   ; -+
#^+NumpadEnter::Unicode("≈") ; approx

#^+NumpadHome::Unicode("⅛")  ; 1/8
#^+NumpadUp::Unicode("�?")    ; 5/8
#^+NumpadPgUp::Unicode("⅜")  ; 3/8
#^+NumpadLeft::send �
#^+NumpadClear::send �
#^+NumpadRight::send �
#^+NumpadEnd::send � 
#^+NumpadDown::send � 
#^+NumpadPgDn::send � 
#^+NumpadIns::send � 
#^+NumPadDel::send `,
  


; ------------------------------
; 5. Ebene
; NumLock on + Mod5 
; --> Br�che (genau wie Ebene 4)
; ------------------------------


<^>!NumpadDiv::send / 
<^>!NumpadMult::Unicode("⋅")   ; cdot
<^>!NumpadSub::send -            ; eig. unbelegt
<^>!NumpadAdd::Unicode("∓")    ; -+
<^>!NumpadEnter::Unicode("≈")  ; approx


<^>!Numpad7::Unicode("⅛")  ; 1/8
<^>!Numpad8::Unicode("�?")  ; 5/8
<^>!Numpad9::Unicode("⅜")  ; 3/8
<^>!Numpad4::send �
<^>!Numpad5::send �
<^>!Numpad6::send �
<^>!Numpad1::send � 
<^>!Numpad2::send � 
<^>!Numpad3::send � 
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


toggleneo:
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