/*
   NEO-Layout
    Version vom 02.05.2007
   3./4. Ebene funktioniert �ber Win+Ctrl, 
    5./6. Ebene �ber AltGr.
   Zur Umbelegung von Win+Ctrl auf CapsLock und #
    und f�r ein zweites AltGr auf <
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
w::send v

e::
  If A_PriorHotkey = <^>!+ ; durchgestrichen
    {
    Send {bs}
    MyUTF_String = ł
    Gosub Unicode
    }
  Else send l
Return 

r::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = ĉ
    Gosub Unicode
    }
  Else If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = č
    Gosub Unicode
    }
  Else If A_PriorHotkey = � ; akut
    {
    Send {bs}
    MyUTF_String = ć
    Gosub Unicode
    }
  Else If A_PriorHotkey = #^� ; cedilla
    {
    Send {bs}
    MyUTF_String = ç
    Gosub Unicode
    }
  Else 
    Send c
Return 

t::send w
z::send k
u::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = ĥ
    Gosub Unicode
    }
  Else send h
Return

i::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = ĝ
    Gosub Unicode
    }
  Else send g
Return

o::
  If A_PriorHotkey = <^>!+ ; durchgestrichen
    {
    Send {bs}
    MyUTF_String = ƒ
    Gosub Unicode
    }
  Else send f
Return

p::send q
�::send �
+::send ~ ; tilde, soll tot

a::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = #^++ ; doppelakut
    {
    Send {bs}
    MyUTF_String = ű
    Gosub Unicode
    }
;  Else If A_PriorHotkey = +^ ; caron
;    {
;    Send {bs}
;    MyUTF_String = 
;    Gosub Unicode
;    }
  Else If A_PriorHotkey = #^^ ; brevis
    {
    Send {bs}
    MyUTF_String = ŭ 
    Gosub Unicode
    }
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = ū
    Gosub Unicode
    }
  Else
    send u
Return

s::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = ī
    Gosub Unicode
    }
  Else 
    Send i
Return

d::
  If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = <^>!+� ; Ring drauf
    Send {bs}�
  Else If A_PriorHotkey = + ; tilde
    {
    Send {bs}
    MyUTF_String = ã
    Gosub Unicode
    }
  Else If A_PriorHotkey = #^+� ; ogonek
    {
    Send {bs}
    MyUTF_String = ą
    Gosub Unicode
    }
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = ā
    Gosub Unicode
    }
  Else 
    Send a
Return 

f::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = #^+� ; ogonek
    {
    Send {bs}
    MyUTF_String = ę
    Gosub Unicode
    }
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = ē
    Gosub Unicode
    }
  Else 
    Send e
Return 

g::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = + ; tilde
    {
    Send {bs}
    MyUTF_String = õ
    Gosub Unicode
    }
  Else If A_PriorHotkey = #^++ ; doppel akut
    {
    Send {bs}
    MyUTF_String = ő
    Gosub Unicode
    }
  Else If A_PriorHotkey = <^>!+ ; durchgestrichen
    {
    Send {bs}
    MyUTF_String = ø
    Gosub Unicode
    }
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = ō
    Gosub Unicode
    }
  Else 
    send o
Return

h::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = ŝ
    Gosub Unicode
    }
  Else If A_PriorHotkey = � ; akut
    {
    Send {bs}
    MyUTF_String = ś
    Gosub Unicode
    }
  Else If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = š
    Gosub Unicode
    }
  Else   
    send s
Return

j::
  If A_PriorHotkey = � ; akut
    {
    Send {bs}
    MyUTF_String = ń
    Gosub Unicode
    }
  Else If A_PriorHotkey = + ; tilde
    {
    Send {bs}
    MyUTF_String = ñ
    Gosub Unicode
    }
  Else
    send n
Return

k::send r
l::send t

�::
  If A_PriorHotkey = <^>!+ ; durchgestrichen
    {
    Send {bs}
    MyUTF_String = ð
    Gosub Unicode
    }
  Else 
    send d
Return

�::  
  If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else
    send y
Return

;SC02B (#) wird zu AltGr

;SC056 (<) wird zu Mod5
y::send �
x::send �
c::send �
v::send p

b::
  If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = ž
    Gosub Unicode
    }
  Else If A_PriorHotkey = � ; akut
    {
    Send {bs}
    MyUTF_String = ź
    Gosub Unicode
    }
  Else If A_PriorHotkey = <^>!� ; punkt dr�ber
    {
    Send {bs}
    MyUTF_String = ż
    Gosub Unicode
    }
  Else 
    Send z
Return 

n::send b
m::send m
,::send `,
.::send .

-::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = ĵ
    Gosub Unicode
    }
  Else
    send j
Return



;2. Ebene (Shift)
;---------

+^::  ; caron, soll tot
   MyUTF_String = ˇ
   Gosub Unicode
   return

+1::send �
+2::send 2 
+3::send �
+4::send $
+5::send �
+6::send �
+7::send �
+8::send �
+9::send �
+0::send �

+�::    ; Ged
MyUTF_String = –
Gosub Unicode
return

+�::send `` ; gravis, tot

+q::send X
+w::send V
+e::send L

+r::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = Ĉ
    Gosub Unicode
    }
  Else If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Č
    Gosub Unicode
    }
  Else If A_PriorHotkey = � ; akut
    {
    Send {bs}
    MyUTF_String = Ć
    Gosub Unicode
    }
  Else If A_PriorHotkey = #^� ; cedille
    {
    Send {bs}
    MyUTF_String = Ç
    Gosub Unicode
    }
  Else 
    Send C
Return 

+t::send W
+z::send K
+u::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = Ĥ
    Gosub Unicode
    }
  Else send H
Return

+i::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = Ĝ
    Gosub Unicode
    }
  Else send G
Return

+o::
  If A_PriorHotkey = <^>!+ ; durchgestrichen
    {
    Send {bs}
    MyUTF_String = ₣
    Gosub Unicode
    }
  Else send F
Return

+p::send Q
+�::send �

++::  ; macron, soll tot 
MyUTF_String = ˉ 
Gosub Unicode
return

+a::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
;  Else If A_PriorHotkey = <^>!+� ; ring dr�ber
;    {
;    Send {bs}
;    MyUTF_String = Ů
;    Gosub Unicode
;    }
  Else If A_PriorHotkey = #^^ ; brevis
    {
    Send {bs}
    MyUTF_String = Ŭ 
    Gosub Unicode
    }
  Else If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Ů
    Gosub Unicode
    }
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = Ū
    Gosub Unicode
    }
  Else
    send U
Return

+s::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = Ī
    Gosub Unicode
    }
  Else 
    Send I
Return

+d::
  If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = + ; tilde
    {
    Send {bs}
    MyUTF_String = Ã
    Gosub Unicode
    }
  Else If A_PriorHotkey = <^>!+� ; Ring drauf
    Send {bs}�
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = Ā
    Gosub Unicode
    }
  Else 
    Send A
Return 

+f::
  If A_PriorHotkey = #^+ ; Diaerese
    Send, {bs}�
  Else If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Ě
    Gosub Unicode
    }
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = Ē
    Gosub Unicode
    }
  Else 
    Send E
Return 

+g::
  If A_PriorHotkey = <^>!+ ; durchgestrichen
    {
    Send {bs}
    MyUTF_String = Ø
    Gosub Unicode
    }
  Else If A_PriorHotkey = + ; tilde
    {
    Send {bs}
    MyUTF_String = Õ
    Gosub Unicode
    }
  Else If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else If A_PriorHotkey = ++ ; macron
    {
    Send {bs}
    MyUTF_String = Ō
    Gosub Unicode
    }
  Else
    send O
Return

+h::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = Ŝ
    Gosub Unicode
    }
  Else If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Š
    Gosub Unicode
    }
  Else
    send S
Return

+j::
  If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Ň
    Gosub Unicode
    }
  Else If A_PriorHotkey = + ; tilde
    {
    Send {bs}
    MyUTF_String = Ñ
    Gosub Unicode
    }
  Else
    send N
Return

+k::
  If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Ř
    Gosub Unicode
    }
  Else 
    send R
Return

+l::
  If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Ť
    Gosub Unicode
    }
  Else 
    send T
Return


+�::
  If A_PriorHotkey = <^>!+ ; durchgestrichen
    {
    Send {bs}
    MyUTF_String = Đ
    Gosub Unicode
    }
  Else If A_PriorHotkey = +^ ; caron
    {
    Send {bs}
    MyUTF_String = Ď
    Gosub Unicode
    }
  Else send D
Return

+�::  
  If A_PriorHotkey = #^+ ; Diaerese
    Send {bs}�
  Else
    send Y
Return

+y::send �
+x::send �
+c::send �
+v::send P

+b::  
  If A_PriorHotkey = +^ ; caron  
    {
    Send {bs}
    MyUTF_String = Ž
    Gosub Unicode
    }
  Else
    send Z
Return

+n::send B
+m::send M
+,::send `;
+.::send :

+-::
  If A_PriorHotkey = ^ ; circumflex
    {
    Send {bs}
    MyUTF_String = Ĵ
    Gosub Unicode
    }
  Else
    send J
Return

;3. Ebene 
;(Win+Ctrl, �ber CapsLock und # zu erreichen)
;---------------------------------------------

#^^:: ; brevis, soll tot
MyUTF_String = ˘
Gosub Unicode
return

#^1:: 
MyUTF_String = ¬ 
Gosub Unicode
return

#^2::send {^}{space} 
#^3::send 3 
#^4::send � 
#^5::send �  
#^6::send � 
#^7::send � 
#^8::send �
#^9::send �
#^0::send �

#^�::
MyUTF_String = — 
Gosub Unicode
return

#^�::send � ; cedillia, soll tot

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

#^�::  ;ij
MyUTF_String = ĳ
Gosub Unicode
return

#^+:: ; Diaerese, soll tot
MyUTF_String = ¨
Gosub Unicode
return


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



;4. Ebene 
;(Win+Ctrl+Shift)
;-----------------

#^+^::send � 
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

#^+�:: ; ogonek, soll tot
MyUTF_String = ˛
Gosub Unicode
return


#^+q::  ;xi
MyUTF_String = ξ 
Gosub Unicode
return

#^+w::send v

#^+e::  ;lambda
MyUTF_String = λ 
Gosub Unicode
return

#^+r::  ;chi 
MyUTF_String = χ
Gosub Unicode
return

#^+t::send w

#^+z:: ;kappa
MyUTF_String = κ
Gosub Unicode
return

#^+u:: ;psi
MyUTF_String = ψ
Gosub Unicode
return

#^+i:: ;gamma
MyUTF_String = γ
Gosub Unicode
return

#^+o:: ;phi
MyUTF_String = φ
Gosub Unicode
return

#^+p::send q

#^+�:: ;IJ
MyUTF_String = Ĳ
Gosub Unicode
return

#^++::send " ;doppelakut, soll tot

#^+a::send u

#^+s:: ;iota
MyUTF_String = ι
Gosub Unicode
return

#^+d:: ;alpha
MyUTF_String = α
Gosub Unicode
return

#^+f:: ;epsilon
MyUTF_String = ε
Gosub Unicode
return

#^+g:: ;omega
MyUTF_String = ω
Gosub Unicode
return

#^+h:: ;sigma
MyUTF_String = σ
Gosub Unicode
return

#^+j:: ;nu
MyUTF_String = ν
Gosub Unicode
return

#^+k:: ;rho
MyUTF_String = ρ
Gosub Unicode
return

#^+l:: ;tau
MyUTF_String = τ
Gosub Unicode
return

#^+�:: ;delta
MyUTF_String = δ
Gosub Unicode
return

#^+�:: ;upsilon
MyUTF_String = υ
Gosub Unicode
return



#^+y::send �
#^+x::send �

#^+c:: ;eta
MyUTF_String = η
Gosub Unicode
return

#^+v:: ;pi
MyUTF_String = π
Gosub Unicode
return

#^+b:: ;zeta
MyUTF_String = ζ
Gosub Unicode
return

#^+n:: ;beta
MyUTF_String = β
Gosub Unicode
return

#^+m:: ;mu
MyUTF_String = μ
Gosub Unicode
return

#^+,:: ;vartheta?
MyUTF_String = ϑ
Gosub Unicode
return

#^+.:: ;theta
MyUTF_String = θ
Gosub Unicode
return

#^+-::send j



;5. Ebene (AltGr)
;-----------------

<^>!4::Send {PgUp} ;Prev
<^>!8::Send /
<^>!9::Send *
<^>!0::Send -

<^>!�:: ; punkt oben dr�ber, soll tot
MyUTF_String = ˙
Gosub Unicode
return


<^>!q::Send {Esc}
<^>!w::Send {Backspace}
<^>!e::Send {Up}
<^>!t::Send {Insert}
<^>!z::Send �
<^>!u::Send 7
<^>!i::Send 8
<^>!o::Send 9
<^>!p::Send {+}

<^>!�:: 
MyUTF_String = ə
Gosub Unicode
return

<^>!+:: ; durchgestrichen, soll tot
MyUTF_String = /
Gosub Unicode
return

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

<^>!�:: ; � ( �? )
MyUTF_String = þ
Gosub Unicode
return


<^>!y::Send {Tab}
<^>!x::Send {Del}
<^>!c::Send {PgDn} ;Next
<^>!n::Send �
<^>!m::Send 1
<^>!,::Send 2
<^>!.::Send 3
<^>!-::Send .

<^>!Space::Send 0
  ; <^>!SC138::Send {NumpadDot} 
  ; geht nicht, weil sonst AltGr nur noch , macht



;6. Ebene (AltGr+Shift)
;-----------------------

<^>!+4::Send +{Prev}

<^>!+�:: ; ring obendrauf, soll tot
MyUTF_String = ˚
Gosub Unicode
return

<^>!+q:: ; Xi?
MyUTF_String = Ξ
Gosub Unicode
return
 
<^>!+w:: ; Lambda
MyUTF_String = Λ
Gosub Unicode
return

<^>!+e::Send +{Up}
<^>!+r::Send � 
<^>!+t::Send +{Insert}

<^>!+u:: ; Phi
MyUTF_String = Ψ
Gosub Unicode
return

<^>!+i:: ; Gamma
MyUTF_String = Γ
Gosub Unicode
return

<^>!+o:: ; Psi
MyUTF_String = Φ
Gosub Unicode
return

<^>!+�:: ; ?
MyUTF_String = Ə
Gosub Unicode
return

<^>!++::  ; komma drunter, soll tot 
MyUTF_String = ˏ 
Gosub Unicode
return

<^>!+a::Send +{Home}
<^>!+s::Send +{Left}
<^>!+d::Send +{Down}
<^>!+f::Send +{Right}
<^>!+g::Send +{End}
<^>!+h:: ; Sigma
MyUTF_String = Σ
Gosub Unicode
return

<^>!+j:: ; No
MyUTF_String = №
Gosub Unicode
return

<^>!+k:: ; (R)
MyUTF_String = ®
Gosub Unicode
return

<^>!+l:: ; TM
MyUTF_String = ™
Gosub Unicode
return

<^>!+�:: ; Delta
MyUTF_String = Δ
Gosub Unicode
return

<^>!+�:: ; � ( �? )
MyUTF_String = Þ
Gosub Unicode
return


<^>!+y::Send +{Tab}

<^>!+c::Send +{PgDn}

<^>!+v:: ; Pi
MyUTF_String = Π
Gosub Unicode
return

<^>!+b:: ; Omega
MyUTF_String = Ω
Gosub Unicode
return

<^>!+.:: ; Theta 
MyUTF_String = Θ
Gosub Unicode
return



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
  ; #e::send #l  funktioniert nicht, Computer wird nicht gesperrt
Run,%A_WinDir%\System32\Rundll32.exe User32.dll`,LockWorkStation 
  ; http://www.autohotkey.com/forum/viewtopic.php?p=66937#66937
return

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
;---------

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
;   oder NumLock On + Shift
; --> Cursortasten
; -----------------

; 3. Ebene
; NumLock on 
; + CapsLock
; --> Pfeile
; -----------------

#^NumpadDiv::send �
#^NumpadMult::send �
#^NumpadSub::send -
#^NumpadAdd::send �
#^NumpadEnter::    ; neq
  MyUTF_String = ≠
  Gosub Unicode
  return

#^Numpad7::  ;7/8
  MyUTF_String = ⅞ 
  Gosub Unicode
  return
#^Numpad8::   ; uparrow
  MyUTF_String = ↑
  Gosub Unicode
  return
#^Numpad9::   ;  3/8
  MyUTF_String = ⅜
  Gosub Unicode
  return
#^Numpad4::   ; leftarrow
  MyUTF_String = ←
  Gosub Unicode
  return
#^Numpad5::send �
#^Numpad6::   ; rightarrow
  MyUTF_String = →
  Gosub Unicode
  return
#^Numpad1::send � 
#^Numpad2::   ; downarrow
  MyUTF_String = ↓
  Gosub Unicode
  return
#^Numpad3::send �
#^Numpad0::send `%
#^NumPadDot::send .




; -----------------
; 4. Ebene
; NumLock off
; + AltGr + Shift
; --> Br�che
; -----------------

;  Achtung! Wenn Numlock on:
;  #^+Numpad7       ; Log off (AltGr + Pos1)
;  #^+Numpad4       ; Ctrl + Left
;  #^+Numpad6       ; Ctrl + Right
;  #^+Numpad1       ; Shut down (AltGr + Ende)
;  (Shift schaltet Numpad aus)


#^+NumpadDiv::   ; slash
  MyUTF_String = ∕
  Gosub Unicode
  return
#^+NumpadMult::  ; cdot
  MyUTF_String = ⋅
  Gosub Unicode
  return
#^+NumpadSub::send - ; eig. unbelegt
#^+NumpadAdd::    ; -+
  MyUTF_String = ∓
  Gosub Unicode
  return 
#^+NumpadEnter::   ; approx
  MyUTF_String = ≈
  Gosub Unicode
  return  


#^+NumpadHome::  ; 1/8
  MyUTF_String = ⅛
  Gosub Unicode
  return  
#^+NumpadUp::  ; 5/8
  MyUTF_String = ⅝
  Gosub Unicode
  return   
#^+NumpadPgUp::  ; 3/8
  MyUTF_String = ⅜
  Gosub Unicode
  return  
#^+NumpadLeft::send �
#^+NumpadClear::send �
#^+NumpadRight::send �
#^+NumpadEnd::send � 
#^+NumpadDown::send � 
#^+NumpadPgDn::send � 
#^+NumpadIns::send � 
#^+NumPadDel::send `,
  


; -----------------
; 5. Ebene
; NumLock on
; + Mod5 (Win + Ctrl)
; --> Br�che (genau wie Ebene 4)
; -----------------


<^>!NumpadDiv::send / 
<^>!NumpadMult::    ; cdot
  MyUTF_String = ⋅ 
  Gosub Unicode
  return 
<^>!NumpadSub::send - ; eig. unbelegt
<^>!NumpadAdd::    ; -+
  MyUTF_String = ∓
  Gosub Unicode
  return 
<^>!NumpadEnter::   ; approx
  MyUTF_String = ≈
  Gosub Unicode
  return  


<^>!Numpad7::  ; 1/8
  MyUTF_String = ⅛
  Gosub Unicode
  return  
<^>!Numpad8::  ; 5/8
  MyUTF_String = ⅝
  Gosub Unicode
  return   
<^>!Numpad9::  ; 3/8
  MyUTF_String = ⅜
  Gosub Unicode
  return  
<^>!Numpad4::send �
<^>!Numpad5::send �
<^>!Numpad6::send �
<^>!Numpad1::send � 
<^>!Numpad2::send � 
<^>!Numpad3::send � 
<^>!Numpad0::send � 
<^>!NumPadDot::send `,


; ------------------------------------



Unicode:
   ; Place Unicode text onto the clipboard:
  Transform, Clipboard, Unicode, %MyUTF_String%  
   ; Paste the clipboard's Unicode text: 
  send ^v
return

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
