/*
Die eigentliche NEO-Belegung und der Hauptteil des AHK-Treibers.


   Ablauf bei toten Tasten:
   1. Ebene Aktualisieren
   2. Abh�ngig von der Variablen "Ebene" Zeichen ausgeben und die Variable "PriorDeadKey" setzen
   
   Ablauf bei "untoten" Tasten:
   1. Ebene Aktualisieren
   2. Abh�ngig von den Variablen "Ebene" und "PriorDeadKey" Zeichen ausgeben
   3. "PriorDeadKey" mit leerem String �berschreiben

   ------------------------------------------------------
   Reihe 1
   ------------------------------------------------------
*/


neo_tot1:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      deadUni(0x02C6) ; circumflex, tot
      DeadKey := "c1"
   }
   else if (Ebene = 2)
   {
      deadUni(0x02C7) ; caron, tot
      DeadKey := "c2"
   }
   else if (Ebene = 3)
   {
      deadUni(0x02D8) ; brevis
      DeadKey := "c3"
   }
   else if (Ebene = 4)
   {
      deadUni(0x00B7) ; Mittenpunkt, tot
      DeadKey := "c4"
   }
   else if (Ebene = 5)
   {
      deadAsc("-")                 ; querstrich, tot
      DeadKey := "c5"
   }
   else if (Ebene = 6)
   {
      deadAsc(".")                 ; punkt darunter (colon)
      DeadKey := "c6"
   }
   CompKey := PriorCompKey
return

neo_1:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x00B9)
        or CheckDeadUni("c5",0x2081)
        or CheckComp3Uni("r_1",0x217A)       ; r�misch xi
        or CheckComp3Uni("R_1",0x216A))      ; r�misch XI
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}1{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}1

      if      (PriorDeadKey = "comp")
         CompKey := "1"
      else if (PriorCompKey == "r")
         CompKey := "r_1"
      else if (PriorCompKey == "R")
         CompKey := "R_1"
   }
   else if (Ebene = 2)
      send �
   else if (Ebene = 3)
      SendUnicodeChar(0x00B9) ; 2 Hochgestellte
   else if (Ebene = 4)
      SendUnicodeChar(0x2022) ; bullet
   else if (Ebene = 5)
      SendUnicodeChar(0x2640) ; Piktogramm weiblich
   else if (Ebene = 6)
      SendUnicodeChar(0x00AC) ; Nicht-Symbol
return

neo_2:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x00B2)
        or CheckDeadUni("c5",0x2082)
        or CheckCompUni("r",0x2171)      ; r�misch ii
        or CheckCompUni("R",0x2161)      ; r�misch II
        or CheckComp3Uni("r_1",0x217B)   ; r�misch xii
        or CheckComp3Uni("R_1",0x216B))  ; r�misch XII
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}2{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}2

      if (PriorDeadKey = "comp")
         CompKey := "2"
   }
   else if (Ebene = 2)
      SendUnicodeChar(0x2116) ; numero
   else if (Ebene = 3)
      SendUnicodeChar(0x00B2) ; 2 Hochgestellte
   else if (Ebene = 4)
      SendUnicodeChar(0x2023) ; aufzaehlungspfeil
   else if (Ebene = 5)
      SendUnicodeChar(0x26A5) ; Piktogramm Zwitter
   else if (Ebene = 6)
      SendUnicodeChar(0x2228) ; Logisches Oder
return

neo_3:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x00B3)
        or CheckDeadUni("c5",0x2083)
        or CheckCompUni("1",0x2153)           ; 1/3
        or CheckCompUni("2",0x2154)           ; 2/3
        or CheckCompUni("r",0x2172)           ; r�misch iii
        or CheckCompUni("R",0x2162))          ; r�misch III
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}3{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}3

      if (PriorDeadKey = "comp")
         CompKey := "3"
   }
   else if (Ebene = 2)
      send �
   else if (Ebene = 3)
      SendUnicodeChar(0x00B3) ; 3 Hochgestellte
   else if (Ebene = 4)
   {
       CompKey := PriorCompKey
       DeadKey := PriorDeadKey
   } ; leer
   else if (Ebene = 5)
      SendUnicodeChar(0x2642) ; Piktogramm Mann
   else if (Ebene = 6)
      SendUnicodeChar(0x2227) ; Logisches Und
return

neo_4:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x2074)
        or CheckDeadUni("c5",0x2084)
        or CheckCompUni("r",0x2173)     ; r�misch iv
        or CheckCompUni("R",0x2163))    ; r�misch IV
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}4{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}4

      if (PriorDeadKey = "comp")
         CompKey := "4"
   }
   else if (Ebene = 2)
      SendUnicodeChar(0x00BB) ; �, Double guillemot right
    else if (Ebene = 3)
      Send {blind}� ; Single guillemot right
   else if (Ebene = 4)
      Send {blind}{PgUp}    ; Prev
   else if (Ebene = 5)
      SendUnicodeChar(0x2113) ; Script small L
   else if (Ebene = 6)
      SendUnicodeChar(0x22A5) ; Senkrecht
return

neo_5:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x2075)
        or CheckDeadUni("c5",0x2085)
        or CheckCompUni("1",0x2155)           ; 1/5
        or CheckCompUni("2",0x2156)           ; 2/5
        or CheckCompUni("3",0x2157)           ; 3/5
        or CheckCompUni("4",0x2158)           ; 4/5
        or CheckCompUni("r",0x2174)           ; r�misch v
        or CheckCompUni("R",0x2164))          ; r�misch V
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}5{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}5

      if (PriorDeadKey = "comp")
         CompKey := "5"
   }
   else if (Ebene = 2)
      SendUnicodeChar(0x00AB) ; �, Double guillemot left
   else if (Ebene = 3)
      Send {blind}� ; Single guillemot left
   else if (Ebene = 4)
   {
       CompKey := PriorCompKey
       DeadKey := PriorDeadKey
   } ; leer
   else if (Ebene = 5)
      SendUnicodeChar(0x2020) ; Kreuz (Dagger)
   else if (Ebene = 6)
      SendUnicodeChar(0x2221) ; Winkel
return

neo_6:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x2076)
        or CheckDeadUni("c5",0x2086)
        or CheckCompUni("1",0x2159)           ; 1/6
        or CheckCompUni("5",0x215A)           ; 5/6
        or CheckCompUni("r",0x2175)           ; r�misch vi
        or CheckCompUni("R",0x2165))          ; r�misch VI
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}6{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}6

      if (PriorDeadKey = "comp")
         CompKey := "6"
   }
   else if (Ebene = 2)
      send �
   else if (Ebene = 3)
      send {blind}�
   else if (Ebene = 4)
      send {blind}�
   else if (Ebene = 5)
   {
       CompKey := PriorCompKey
       DeadKey := PriorDeadKey
   } ; leer
   else if (Ebene = 6)
      SendUnicodeChar(0x2225) ; parallel
return

neo_7:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x2077)
        or CheckDeadUni("c5",0x2087)
        or CheckCompUni("r",0x2176)     ; r�misch vii
        or CheckCompUni("R",0x2166))    ; r�misch VII
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}7{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}7

      if (PriorDeadKey = "comp")
         CompKey := "7"
   }
   else if (Ebene = 2)
      send $
   else if (Ebene = 3)
      send {blind}�
   else if (Ebene = 4)
      send {blind}� 
   else if (Ebene = 5)
      SendUnicodeChar(0x03BA) ; greek small letter kappa
   else if (Ebene = 6)
      SendUnicodeChar(0x2209) ; nicht Element von 
return

neo_8:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x2078)
        or CheckDeadUni("c5",0x2088)
        or CheckCompUni("1",0x215B)           ; 1/8
        or CheckCompUni("3",0x215C)           ; 3/8
        or CheckCompUni("5",0x215D)           ; 5/8
        or CheckCompUni("7",0x215E)           ; 7/8
        or CheckCompUni("r",0x2177)           ; r�misch viii
        or CheckCompUni("R",0x2167))          ; r�misch VIII
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}8{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}8

      if (PriorDeadKey = "comp")
         CompKey := "8"
   }
   else if (Ebene = 2)
      send �
   else if (Ebene = 3)
      send {blind}�
   else if (Ebene = 4)
      Send {blind}{NumpadDiv}
   else if (Ebene = 5)
      SendUnicodeChar(0x27E8) ;bra (�ffnende spitze klammer)
   else if (Ebene = 6)
      SendUnicodeChar(0x2204) ; es existiert nicht
return

neo_9:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x2079)
        or CheckDeadUni("c5",0x2089)
        or CheckCompUni("r",0x2178)     ; r�misch ix
        or CheckCompUni("R",0x2168))    ; r�misch IX
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}9{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}9

      if (PriorDeadKey = "comp")
         CompKey := "9"
   }
   else if (Ebene = 2)
      send �
   else if (Ebene = 3)
      send {blind}�
   else if (Ebene = 4)
      Send {blind}{NumpadMult}
   else if (Ebene = 5)
      SendUnicodeChar(0x27E9) ;ket (schlie�ende spitze klammer)
   else if (Ebene = 6)
      SendUnicodeChar(0x2226) ; nicht parallel
return

neo_0:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      if !(CheckDeadUni("c1",0x2070)
        or CheckDeadUni("c5",0x2080)
        or CheckComp3Uni("r_1",0x2179)     ; r�misch x
        or CheckComp3Uni("R_1",0x2169))    ; r�misch X
         if (GetKeyState("CapsLock","T")) 
            send {blind}{Shift down}0{Shift up}
         else if (not(lernModus) or lernModus_std_ZahlenReihe)
            send {blind}0

      if (PriorDeadKey = "comp")
         CompKey := "0"
   }
   else if (Ebene = 2)
      send �
   else if (Ebene = 3)
      send {blind}�
   else if (Ebene = 4)
      Send {blind}{NumpadSub}
   else if (Ebene = 5)
   {
       CompKey := PriorCompKey
       DeadKey := PriorDeadKey
   } ; leer
   else if (Ebene = 6)
      SendUnicodeChar(0x2205) ; leere Menge
return

neo_strich:
   EbeneAktualisieren()
   if (Ebene = 1)
      if (GetKeyState("CapsLock","T")) 
         send {blind}{Shift down}-{Shift up}
      else
         send {blind}- ; Bindestrich-Minus
   else if (Ebene = 2)
      SendUnicodeChar(0x2013) ; Gedankenstrich
   else if (Ebene = 3)
      SendUnicodeChar(0x2014) ; Englischer Gedankenstrich (Geviertstrich)
   else if (Ebene = 4)
   {
       CompKey := PriorCompKey
       DeadKey := PriorDeadKey
   } ; leer
   else if (Ebene = 5)
      SendUnicodeChar(0x2011) ; gesch�tzter Bindestrich (Bindestrich ohne Zeilenumbruch)
   else if (Ebene = 6)
      SendUnicodeChar(0x00AD) ; weicher Bindestrich
return

neo_tot2:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      deadAsc("{�}{space}") ; akut, tot
      DeadKey := "a1"
   }
   else if (Ebene = 2)
   {
      deadAsc("``{space}")
      DeadKey := "a2"
   }
   else if (Ebene = 3)
   {
      deadAsc("�") ; cedilla
      DeadKey := "a3"
   }
   else if (Ebene = 4)
   {
      deadUni(0x02D9) ; punkt oben dr�ber
      DeadKey := "a4"
   }
   else if (Ebene = 5)
   {
      deadUni(0x02DB) ; ogonek
      DeadKey := "a5"
   }
   else if (Ebene = 6)
   {
      deadUni(0x02DA)  ; ring obendrauf
      DeadKey := "a6"
   }
   CompKey := PriorCompKey
return


/*
   ------------------------------------------------------
   Reihe 2
   ------------------------------------------------------
*/

neo_x:
   EbeneAktualisieren()
   if (Ebene12)
      OutputChar("x","X")
   else if (Ebene = 3)
      SendUnicodeChar(0x2026) ;Ellipse
   else if (Ebene = 5)
      SendUnicodeChar(0x03BE) ;xi
   else if (Ebene = 6)
      SendUnicodeChar(0x039E)  ; Xi
return


neo_v:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("c6",0x1E7F,0x1E7E)))
      OutputChar("v","V")
   else if (Ebene = 3)
      send {blind}_
   else if (Ebene = 4)
      if (not(lernModus) or lernModus_neo_Backspace)
         Send {blind}{Backspace}
      else
      {
          CompKey := PriorCompKey
          DeadKey := PriorDeadKey
      } ; leer
   else if (Ebene = 6)
      SendUnicodeChar(0x2259) ; estimates
return



neo_l:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x013A,0x0139)
                  or CheckDeadUni12("a3",0x013C,0x013B)
                  or CheckDeadUni12("c2",0x013E,0x013D)
                  or CheckDeadUni12("c4",0x0140,0x013F)
                  or CheckDeadUni12("c6",0x1E37,0x1E36)
                  or CheckDeadUni12("t4",0x0142,0x0141)))
      OutputChar("l","L")
   else if (Ebene = 3)
      send {blind}[
   else if (Ebene = 4)
      Send {Blind}{Up}
   else if (Ebene = 5)
      SendUnicodeChar(0x03BB) ; lambda
   else if (Ebene = 6)
      SendUnicodeChar(0x039B) ; Lambda
return


neo_c:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x0107,0x0106)
                  or CheckDeadUni12("a3",0x00E7,0x00E6)
                  or CheckDeadUni12("a4",0x010B,0x010A)
                  or CheckDeadUni12("c1",0x0109,0x0108)
                  or CheckDeadUni12("c2",0x010D,0x010C)
                  or CheckCompAsc12("o","�","�")
                  or CheckCompAsc12("O","�","�")))
      OutputChar("c","C")
   else if (Ebene = 3)
      send {blind}]
   else if (Ebene = 4)
      if (not(lernModus) or lernModus_neo_Entf)
        Send {blind}{Del}
      else
      {
          CompKey := PriorCompKey
          DeadKey := PriorDeadKey
      } ; leer
   else if (Ebene = 5)
      SendUnicodeChar(0x03C7) ;chi
   else if (Ebene = 6)
      SendUnicodeChar(0x2102)  ; C (Komplexe Zahlen)
return

neo_w:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("c1",0x0175,0x0174)))
      OutputChar("w","W")
   else if (Ebene = 3)
      SendUnicodeChar(0x005E) ; untotes ^ - Unicode-Name: CIRCUMFLEX ACCENT
      ;send {^}{space} ; Funktioniert nicht unter Java-Programmen 
   else if (Ebene = 4)
      Send {blind}{Insert}
   else if (Ebene = 5)
      SendUnicodeChar(0x03C9) ; omega
   else if (Ebene = 6)
      SendUnicodeChar(0x03A9) ; Omega
return

neo_k:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a3",0x0137,0x0136)
                  or CheckDeadUni12("c6",0x1E33,0x1E32)))
      OutputChar("k","K")
   else if (Ebene = 3)
      send {blind}{!}
   else if (Ebene = 4)
      Send �
   else if (Ebene = 5)
      SendUnicodeChar(0x03F0) ;kappa symbol (varkappa)
   else if (Ebene = 6)
      SendUnicodeChar(0x221A) ; Wurzel
return

neo_h:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a4",0x1E23,0x1E22)
                  or CheckDeadUni12("c1",0x0125,0x0124)
                  or CheckDeadUni12("c5",0x0127,0x0126)
                  or CheckDeadUni12("c6",0x1E25,0x1E24)))
      OutputChar("h","H")
   else if ((Ebene = 3) and !(CheckDeadUni("c5",0x2264))) ; kleiner gleich
      send {blind}<
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x2077)
                           or CheckDeadUni("c5",0x2087)))
      Send {blind}{NumPad7}
   else if (Ebene = 5)
      SendUnicodeChar(0x03C8) ;psi
   else if (Ebene = 6)
      SendUnicodeChar(0x03A8)  ; Psi
return

neo_g:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a3",0x0123,0x0122)
                  or CheckDeadUni12("a4",0x0121,0x0120)
                  or CheckDeadUni12("c1",0x011D,0x011C)
                  or CheckDeadUni12("c3",0x011F,0x011E)))
      OutputChar("g","G")
   else if ((Ebene = 3) and !(CheckDeadUni("c5",0x2265))) ; gr��er gleich
      send {blind}>
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x2078)
                           or CheckDeadUni("c5",0x2088)))
      Send {blind}{NumPad8}
   else if (Ebene = 5)
      SendUnicodeChar(0x03B3) ;gamma
   else if (Ebene = 6)
      SendUnicodeChar(0x0393)  ; Gamma
return

neo_f:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a4",0x1E1F,0x1E1E)
                  or CheckDeadUni12("t4",0x0192,0x0191)))
      OutputChar("f","F")
   else if ((Ebene = 3) and !(CheckDeadUni("a6",0x2257)    ; ring equal to
                      or CheckDeadUni("c1",0x2259)    ; entspricht
                      or CheckDeadUni("c2",0x225A)    ; EQUIANGULAR TO
                      or CheckDeadUni("c5",0x2261)    ; identisch
                      or CheckDeadUni("t1",0x2245)    ; ungef�hr gleich
                      or CheckDeadUni("t4",0x2260)))  ; ungleich
      send {blind}`=
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x2079)
                           or CheckDeadUni("c5",0x2089)))
      Send {blind}{NumPad9}
   else if (Ebene = 5)
      SendUnicodeChar(0x03C6) ; phi
   else if (Ebene = 6)
      SendUnicodeChar(0x03A6)  ; Phi
return

neo_q:
   EbeneAktualisieren()
   if (Ebene12)
      OutputChar("q","Q")
   else if (Ebene = 3)
      send {blind}{&}
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x207A)
                           or CheckDeadUni("c5",0x208A)))
      Send {blind}{NumPadAdd}
   else if (Ebene = 5)
      SendUnicodeChar(0x03D5) ; phi symbol (varphi)
   else if (Ebene = 6)
      SendUnicodeChar(0x211A) ; Q (rationale Zahlen)
return

neo_sz:
   EbeneAktualisieren()
   if (Ebene = 1)
      if (GetKeyState("CapsLock","T"))
         SendUnicodeChar(0x1E9E) ; verssal-�
      else if (LangSTastatur = 1)
         send {blind}s
      else
         send �
   else if (Ebene = 2)
      if (GetKeyState("CapsLock","T"))
         if (LangSTastatur = 1)
            send {blind}s
         else
            send �
      else
         SendUnicodeChar(0x1E9E) ; versal-�
   else if (Ebene = 3)
      if (LangSTastatur = 1)
         send �
      else
         SendUnicodeChar(0x017F) ; langes s
   else if (Ebene = 5)
      SendUnicodeChar(0x03C2) ; varsigma
   else if (Ebene = 6)
      SendUnicodeChar(0x2218) ; Verkn�pfungsoperator
return


neo_tot3:
   EbeneAktualisieren()
   if (Ebene = 1)
   {
      deadUni(0x02DC)  ; tilde, tot 
      DeadKey := "t1"
   }
   else if (Ebene = 2)
   {
      deadUni(0x00AF)  ; macron, tot
      DeadKey := "t2"
   }
   else if (Ebene = 3)
   {
      deadUni(0x00A8)  ; diaerese
      DeadKey := "t3"
   }
   else if (Ebene = 4)
   {
      deadUni(0x002F)  ; Schr�gstrich, tot
      DeadKey := "t4"
   }
   else if (Ebene = 5)
   {
      deadUni(0x02DD)  ;doppelakut
      DeadKey := "t5"
   }
   else if (Ebene = 6)
   {
      deadUni(0x02CF)  ; komma drunter, tot
      DeadKey := "t6"
   }
   
return


/*
   ------------------------------------------------------
   Reihe 3
   ------------------------------------------------------
*/

neo_u:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x00FA,0x00DA)
                  or CheckDeadUni12("a2",0x00F9,0x00D9)
                  or CheckDeadUni12("a5",0x0173,0x0172)
                  or CheckDeadUni12("a6",0x016F,0x016E)
                  or CheckDeadUni12("c1",0x00FB,0x00DB)
                  or CheckDeadUni12("c2",0x01D4,0x01D3)
                  or CheckDeadUni12("c3",0x016D,0x016C)
                  or CheckDeadUni12("t1",0x0169,0x0168)
                  or CheckDeadUni12("t2",0x016B,0x016A)
                  or CheckDeadAsc12("t3","�","�")
                  or CheckDeadUni12("t5",0x0171,0x0170)))
      OutputChar("u","U")
   else if (Ebene = 3)
      send {blind}\
   else if (Ebene = 4)
      Send {blind}{Home}
   else if (Ebene = 5)
   {
       CompKey := PriorCompKey
       DeadKey := PriorDeadKey
   } ; leer
   else if (Ebene = 6)
      SendUnicodeChar(0x222E) ; contour integral
return

neo_i:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x00ED,0x00CD)
                  or CheckDeadUni12("a2",0x00EC,0x00CC)
                  or CheckDeadUni12("a4",0x012F,0x012E)
                  or CheckDeadUni12("a5",0x0131,0x0130)
                  or CheckDeadUni12("c1",0x00EE,0x00CE)
                  or CheckDeadUni12("c2",0x01D0,0x01CF)
                  or CheckDeadUni12("c3",0x012D,0x012C)
                  or CheckDeadUni12("t1",0x0129,0x0128)
                  or CheckDeadUni12("t2",0x012B,0x012A)
                  or CheckDeadAsc12("t3","�","�")))
      OutputChar("i","I")
   else if (Ebene = 3)
      send {blind}`/
   else if (Ebene = 4)
      Send {Blind}{Left}
   else if (Ebene = 5    )
      SendUnicodeChar(0x03B9) ; iota
   else if (Ebene = 6)
      SendUnicodeChar(0x222B) ; integral
return

neo_a:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x00E1,0x00C1)
                  or CheckDeadUni12("a2",0x00E0,0x00C0)
                  or CheckDeadUni12("a5",0x0105,0x0104)
                  or CheckDeadAsc12("a6","�","�")
                  or CheckDeadUni12("c1",0x00E2,0x00C2)
                  or CheckDeadUni12("c2",0x01CE,0x01CD)
                  or CheckDeadUni12("c3",0x0103,0x0102)
                  or CheckDeadUni12("t1",0x00E3,0x00C3)
                  or CheckDeadUni12("t2",0x0101,0x0100)
                  or CheckDeadAsc12("t3","�","�")))
      OutputChar("a","A")
   else if (Ebene = 3)
      send {blind}{{}   ; }
   else if (Ebene = 4)
      Send {Blind}{Down}
   else if (Ebene = 5)
      SendUnicodeChar(0x03B1) ;alpha
   else if (Ebene = 6)
      SendUnicodeChar(0x2200) ;fuer alle   
return

neo_e:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x00E9,0x00C9)
                  or CheckDeadUni12("a2",0x00E8,0x00C8)
                  or CheckDeadUni12("a4",0x0117,0x0116)
                  or CheckDeadUni12("a5",0x0119,0x0118)
                  or CheckDeadUni12("c1",0x00EA,0x00CA)
                  or CheckDeadUni12("c2",0x011B,0x011A)
                  or CheckDeadUni12("c3",0x0115,0x0114)
                  or CheckDeadUni12("t2",0x0113,0x0112)
                  or CheckDeadAsc12("t3","�","�")
                  or CheckCompAsc12("a","�","�")
                  or CheckCompAsc12("A","�","�")
                  or CheckCompAsc12("o","�","�")
                  or CheckCompAsc12("O","�","�")))
      OutputChar("e","E")
   else if (Ebene = 3)      ; {
      send {blind}{}}
   else if (Ebene = 4)
      Send {Blind}{Right}
   else if (Ebene = 5)
        SendUnicodeChar(0x03B5) ;epsilon
   else if (Ebene = 6)
        SendUnicodeChar(0x2203) ;es existiert   
return

neo_o:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x00F3,0x00D3)
                  or CheckDeadUni12("a2",0x00F2,0x00D2)
                  or CheckDeadUni12("a5",0x01EB,0x01EA)
                  or CheckDeadUni12("c1",0x00F4,0x00D4)
                  or CheckDeadUni12("c2",0x01D2,0x01D1)
                  or CheckDeadUni12("c3",0x014F,0x014E)
                  or CheckDeadUni12("t1",0x00F5,0x00D5)
                  or CheckDeadUni12("t2",0x014D,0x014C)
                  or CheckDeadAsc12("t3","�","�")
                  or CheckDeadUni12("t4",0x00F8,0x00D8)
                  or CheckDeadUni12("t5",0x0151,0x0150)))
      OutputChar("o","O")
   else if (Ebene = 3)
      send {blind}*
   else if (Ebene = 4)
      Send {blind}{End}
   else if (Ebene = 5)
      SendUnicodeChar(0x03BF) ; omicron
   else if (Ebene = 6)
      SendUnicodeChar(0x2208) ; element of
return

neo_s:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x015B,0x015A)
                  or CheckDeadUni12("a3",0x015F,0x015E)
                  or CheckDeadUni12("a4",0x1E61,0x1E60)
                  or CheckDeadUni12("c1",0x015D,0x015C)
                  or CheckDeadUni12("c2",0x0161,0x0160)
                  or CheckDeadUni12("c6",0x1E63,0x1A62)))
      if (LangSTastatur = 1)
         if (GetKeyState("CapsLock","T") xor (Ebene = 1))
            SendUnicodeChar(0x017F) ; langes s
         else
            OutputChar("s","S")
      else
         OutputChar("s","S")
   else if (Ebene = 3)
      send {blind}?
   else if (Ebene = 4)
      Send �
   else if (Ebene = 5)
      SendUnicodeChar(0x03C3) ;sigma
   else if (Ebene = 6)
      SendUnicodeChar(0x03A3)  ; Sigma
return

neo_n:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x0144,0x0143)
                  or CheckDeadUni12("a3",0x0146,0x0145)
                  or CheckDeadUni12("a4",0x1E45,0x1E44)
                  or CheckDeadUni12("c2",0x0148,0x0147)
                  or CheckDeadUni12("t1",0x00F1,0x00D1)))
      OutputChar("n","N")
   else if (Ebene = 3)
      send {blind}(                 ; )
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x2074)
                           or CheckDeadUni("c5",0x2084)))
      Send {blind}{NumPad4}
   else if (Ebene = 5)
      SendUnicodeChar(0x03BD) ; nu
   else if (Ebene = 6)
      SendUnicodeChar(0x2115) ; N (nat�rliche Zahlen)
return

neo_r:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x0155,0x0154)
                  or CheckDeadUni12("a3",0x0157,0x0156)
                  or CheckDeadUni12("a4",0x0E59,0x0E58)
                  or CheckDeadUni12("c2",0x0159,0x0158)
                  or CheckDeadUni12("c6",0x1E5B,0x1E5A)
                  or CheckCompAsc12("o","�","�")
                  or CheckCompAsc12("O","�","�")))
      OutputChar("r","R")
   else if (Ebene = 3)                ;(
      send {blind})
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x2075)
                           or CheckDeadUni("c5",0x2085)))
      Send {blind}{NumPad5}
   else if (Ebene = 5)
      SendUnicodeChar(0x03F1) ; rho symbol (varrho)
   else if (Ebene = 6)
      SendUnicodeChar(0x211D) ; R (reelle Zahlen)
return

neo_t:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a3",0x0163,0x0162)
                  or CheckDeadUni12("a4",0x1E6B,0x1E6A)
                  or CheckDeadUni12("c2",0x0165,0x0164)
                  or CheckDeadUni12("c5",0x0167,0x0166)
                  or CheckDeadUni12("c6",0x1E6D,0x1E6C)))
      OutputChar("t","T")
   else if (Ebene = 3)
      send {blind}- ; Bis
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x2076)
                           or CheckDeadUni("c5",0x2086)))
      Send {blind}{NumPad6}
   else if (Ebene = 5)
      SendUnicodeChar(0x03C4) ; tau
   else if (Ebene = 6)
      SendUnicodeChar(0x2202 ) ; partielle Ableitung
return

neo_d:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a4",0x1E0B,0x1E0A)
                  or CheckDeadUni12("c2",0x010F,0x010E)
                  or CheckDeadUni12("c5",0x0111,0x0110)
                  or CheckDeadUni12("c6",0x1E0D,0x1E0C)
                  or CheckDeadUni12("t4",0x00F0,0x00D0)))
      OutputChar("d","D")
   else if (Ebene = 3)
      send {blind}:
   else if (Ebene = 4)
		send `,
   else if (Ebene = 5)
      SendUnicodeChar(0x03B4) ;delta
   else if (Ebene = 6)
      SendUnicodeChar(0x0394)  ; Delta
return

neo_y:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x00FD,0x00DD)
                  or CheckDeadUni12("c1",0x0177,0x0176)
                  or CheckDeadAsc12("t3","�",�)))
      OutputChar("y","Y")
   else if (Ebene = 3)
      send {blind}@
   else if (Ebene = 4)
      Send {blind}.
   else if (Ebene = 5)
      SendUnicodeChar(0x03C5) ; upsilon
   else if (Ebene = 6)
      SendUnicodeChar(0x2207) ; nabla
return

/*
   ------------------------------------------------------
   Reihe 4
   ------------------------------------------------------
*/

neo_�:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x01D8,0x01D7)
                  or CheckDeadUni12("a2",0x01DC,0x01DB)
                  or CheckDeadUni12("c2",0x01DA,0x01D9)
                  or CheckDeadUni12("t2",0x01D6,0x01D5)))
      OutputChar("�","�")
   else if (Ebene = 3)
      send {blind}{#}
   else if (Ebene = 4)
      Send {blind}{Esc}
   else if (Ebene = 5)
   {
      DeadKey := PriorDeadKey
      CompKey := PriorCompKey
   } ; leer
   else if (Ebene = 6)
      SendUnicodeChar(0x221D) ; proportional
return

neo_�:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("t2",0x022B,0x022A)))
      OutputChar("�","�")
   else if (Ebene = 3)
      send {blind}$
   else if (Ebene = 4)
      send {blind}{Tab}
   else if (Ebene = 5)
   {
      DeadKey := PriorDeadKey
      CompKey := PriorCompKey
   } ; leer
   else if (Ebene = 6)
      SendUnicodeChar(0x2111) ; Fraktur I
return

neo_�:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("t2",0x01DF,0x01DE)))
      OutputChar("�","�")
   else if (Ebene = 3)
      send {blind}|
   else if (Ebene = 4)
      Send {blind}{PgDn}    ; Next
   else if (Ebene = 5)
      SendUnicodeChar(0x03B7) ; eta
   else if (Ebene = 6)
      SendUnicodeChar(0x211C) ; altes R
return

neo_p:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a4",0x1E57,0x1E56)))
      OutputChar("p","P")
   else if ((Ebene = 3) and !(CheckDeadUni("t1",0x2248)))
      send {blind}~
   else if (Ebene = 4)
        Send {blind}{Enter}
   else if (Ebene = 5)
      SendUnicodeChar(0x03C0) ;pi
   else if (Ebene = 6)
      SendUnicodeChar(0x03A0)  ; Pi
return

neo_z:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a1",0x017A,0x0179)
                  or CheckDeadUni12("a4",0x017C,0x017B)
                  or CheckDeadUni12("c2",0x017E,0x017D)
                  or CheckDeadUni12("c6",0x1E93,0x1E92)))
      OutputChar("z","Z")
   else if (Ebene = 3)
      send ``{space} ; untot
   else if (Ebene = 4)
   {
      DeadKey := PriorDeadKey
      CompKey := PriorCompKey
   } ; leer
   else if (Ebene = 5)
      SendUnicodeChar(0x03B6) ;zeta 
   else if (Ebene = 6)
      SendUnicodeChar(0x2124)  ; Z (ganze Zahlen)
return

neo_b:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a4",0x1E03,0x1E02)))
      OutputChar("b","B")
   else if (Ebene = 3)
      send {blind}{+}
   else if (Ebene = 4)
      send {blind}:
   else if (Ebene = 5)
      SendUnicodeChar(0x03B2) ; beta
   else if (Ebene = 6)
      SendUnicodeChar(0x21D2) ; Doppel-Pfeil rechts
return

neo_m:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("a4",0x1E41,0x1E40)
                  or CheckDeadUni12("c6",0x1E43,0x1E42)
                  or CheckCompUni12("t",0x2122,0x2122)        ; TM
                  or CheckCompUni12("T",0x2122,0x2122)        ; TM
                  or CheckCompUni12("s",0x2120,0x2120)        ; SM
                  or CheckCompUni12("S",0x2120,0x2120)))      ; SM

      OutputChar("m","M")
   else if (Ebene = 3)
      send {blind}`%
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x00B9)
                           or CheckDeadUni("c5",0x2081)))
      Send {blind}{NumPad1}
   else if (Ebene = 5)
      SendUnicodeChar(0x03BC) ; griechisch mu, micro w�re 0x00B5
   else if (Ebene = 6)
      SendUnicodeChar(0x21D4) ; doppelter Doppelpfeil (genau dann wenn)
return

neo_komma:
   EbeneAktualisieren()
   if (Ebene = 1)
      if (GetKeyState("CapsLock","T")) 
         send {blind}{Shift down},{Shift up}
      else
         send {blind},
   else if (Ebene = 2)
       SendUnicodeChar(0x22EE) ;  vertikale ellipse 
   else if (Ebene = 3)
      send {blind}"
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x00B2)
                           or CheckDeadUni("c5",0x2082)))
      Send {blind}{NumPad2}
   else if (Ebene = 5)
      SendUnicodeChar(0x03C1) ; rho
   else if (Ebene = 6)
      SendUnicodeChar(0x21D0) ; Doppelpfeil links
return

neo_punkt:
   EbeneAktualisieren()
   if (Ebene = 1)
      if (GetKeyState("CapsLock","T")) 
         send {blind}{Shift down}.{Shift up}
      else
         send {blind}.
   else if (Ebene = 2)
      SendUnicodeChar(0x2026)  ; ellipse
   else if (Ebene = 3)
      send {blind}'
   else if ((Ebene = 4) and !(CheckDeadUni("c1",0x00B3)
                           or CheckDeadUni("c5",0x2083)))
      Send {blind}{NumPad3}
   else if (Ebene = 5)
      SendUnicodeChar(0x03D1) ; theta symbol (vartheta)
   else if (Ebene = 6)
      SendUnicodeChar(0x0398)  ; Theta
return


neo_j:
   EbeneAktualisieren()
   if (Ebene12 and !(CheckDeadUni12("c1",0x0135,0x0134)
                  or CheckDeadUni12("c2",0x01F0,"")
                  or CheckCompUni12("i",0x0133,"")          ; ij
                  or CheckCompUni12("I","",0x0132)          ; IJ
                  or CheckCompUni12("l",0x01C9,"")          ; lj
                  or CheckCompUni12("L",0x01C8,0x01C7)      ; Lj/LJ
                  or CheckCompUni12("n",0x01CC,"")          ; nj
                  or CheckCompUni12("N",0x01CB,0x01CA)))    ; Nj/NJ
      OutputChar("j","J")
   else if (Ebene = 3)
      send {blind}`;
   else if (Ebene = 4)
      Send {blind}`;
   else if (Ebene = 5)
      SendUnicodeChar(0x03B8) ; theta
   else if (Ebene = 6)
      SendUnicodeChar(0x2261) ; identisch
return

/*
   ------------------------------------------------------
   Numpad
   ------------------------------------------------------

   folgende Tasten verhalten sich bei ein- und ausgeschaltetem
   NumLock gleich:
*/

neo_NumpadDiv:
   EbeneAktualisieren()
   if ((Ebene = 1) or (Ebene = 2))
      send {blind}{NumpadDiv}
   else if (Ebene = 3)
      send {blind}�
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2215)   ; slash
return

neo_NumpadMult:
   EbeneAktualisieren()
   if ((Ebene = 1) or (Ebene = 2))
      send {blind}{NumpadMult}
   else if (Ebene = 3)
      send {blind}�
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x22C5)  ; cdot
return

neo_NumpadSub:
   EbeneAktualisieren()
   if (((Ebene = 1) or (Ebene = 2)) and !(CheckDeadUni("c1",0x207B)
                                       or CheckDeadUni("c5",0x208B)))
      send {blind}{NumpadSub}
   else if (Ebene = 3)
      SendUnicodeChar(0x2212) ; echtes minus
return

neo_NumpadAdd:
   EbeneAktualisieren()
   if (((Ebene = 1) or (Ebene = 2)) and !(CheckDeadUni("c1",0x207A)
                                       or CheckDeadUni("c5",0x208A)))
      send {blind}{NumpadAdd}
   else if (Ebene = 3)
      send {blind}�
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2213)   ; -+
return

neo_NumpadEnter:
   EbeneAktualisieren()
   if ((Ebene = 1) or (Ebene = 2))
      send {blind}{NumpadEnter}      
   else if (Ebene = 3)
      SendUnicodeChar(0x2260) ; neq
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2248) ; approx
return

/*
   folgende Tasten verhalten sich bei ein- und ausgeschaltetem NumLock
   unterschiedlich
*/



neo_Numpad7:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadHome}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadHome}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if (Ebene = 1)
         send {blind}{Numpad7}
      else
         send {blind){Shift up}{Numpad7}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_7"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x2195)   ; Hoch-Runter-Pfeil
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x226A)  ; ll
return

neo_Numpad8:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadUp}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadUp}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if !(CheckCompUni("Num_1",0x215B) ; 1/8
        or CheckCompUni("1",0x215B)     ; 1/8
        or CheckCompUni("Num_3",0x215C) ; 3/8
        or CheckCompUni("3",0x215C)     ; 3/8
        or CheckCompUni("Num_5",0x215D) ; 3/8
        or CheckCompUni("5",0x215D)     ; 5/8
        or CheckCompUni("Num_7",0x215E) ; 7/8
        or CheckCompUni("7",0x215E))    ; 7/8
         if (Ebene = 1)
            send {blind}{Numpad8}
         else
            send {blind){Shift up}{Numpad8}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_8"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x2191)     ; uparrow
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2229)    ; intersection
return

neo_Numpad9:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadPgUp}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadPgUp}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if (Ebene = 1)
         send {blind}{Numpad9}
      else
         send {blind){Shift up}{Numpad9}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_9"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x2297) ; Tensorprodukt ; Vektor in die Ebene zeigend 
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x226B)  ; gg
return



neo_Numpad4:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadLeft}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadLeft}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if !(CheckCompUni("Num_1",0x00BC) ; 1/4
        or CheckCompUni("1",0x00BE)     ; 1/4
        or CheckCompUni("Num_3",0x00BE) ; 3/4
        or CheckCompUni("3",0x00BE))    ; 3/4
         if (Ebene = 1)
            send {blind}{Numpad4}
         else
            send {blind){Shift up}{Numpad4}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_4"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x2190)     ; leftarrow
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2282)  ; subset of
return

neo_Numpad5:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadClear}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadClear}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if !(CheckCompUni("Num_1",0x2155) ; 1/5
        or CheckCompUni("1",0x2155)     ; 1/5
        or CheckCompUni("Num_2",0x2156) ; 2/5
        or CheckCompUni("2",0x2156)     ; 2/5
        or CheckCompUni("Num_3",0x2157) ; 3/5
        or CheckCompUni("3",0x2157)     ; 3/5
        or CheckCompUni("Num_4",0x2158) ; 4/5
        or CheckCompUni("4",0x2158))    ; 4/5
         if (Ebene = 1)
            send {blind}{Numpad5}
         else
            send {blind){Shift up}{Numpad5}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_5"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x221E) ; INFINITY
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x220B) ; enth�lt das Element
return

neo_Numpad6:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadRight}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadRight}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if !(CheckCompUni("Num_1",0x2159) ; 1/6
        or CheckCompUni("1",0x2159)     ; 1/6
        or CheckCompUni("Num_5",0x215A) ; 5/6
        or CheckCompUni("5",0x215A))    ; 5/6
         if (Ebene = 1)
            send {blind}{Numpad6}
         else
            send {blind){Shift up}{Numpad6}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_6"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x2192)     ; rightarrow
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2283) ; superset of
return

neo_Numpad1:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadEnd}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadEnd}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if (Ebene = 1)
         send {blind}{Numpad1}
      else
         send {blind){Shift up}{Numpad1}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_1"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x2194) ; Links-Rechts-Pfeil
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2264)   ; leq
return

neo_Numpad2:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadDown}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadDown}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if !(CheckCompUni("Num_1",0x00BD) ; 1/2
        or CheckCompUni("1",0x00BD))    ; 1/2
         if (Ebene = 1)
            send {blind}{Numpad2}
         else
            send {blind){Shift up}{Numpad2}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_2"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x2193)     ; downarrow
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x222A)  ; vereinigt
return

neo_Numpad3:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadPgDn}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadPgDn}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if !(CheckCompUni("Num_1",0x2153) ; 1/3
        or CheckCompUni("1",0x2154)     ; 1/3
        or CheckCompUni("Num_2",0x2154) ; 2/3
        or CheckCompUni("2",0x2154))    ; 2/3
         if (Ebene = 1)
            send {blind}{Numpad3}
         else
            send {blind){Shift up}{Numpad3}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_3"
   }
   else if (Ebene = 3)
      SendUnicodeChar(0x21CC) ; RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON
   else if ((Ebene = 4) or (Ebene = 5))
      SendUnicodeChar(0x2265)  ; geq
return

neo_Numpad0:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadIns}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadIns}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
   {
      if (Ebene = 1)
         send {blind}{Numpad0}
      else
         send {blind){Shift up}{Numpad0}{Shift down}

      if (PriorDeadKey = "comp")
         CompKey := "Num_0"
   }
   else if (Ebene = 3)
      send {blind}`%
   else if ((Ebene = 4) or (Ebene = 5))
      send � 
return

neo_NumpadDot:
   EbeneAktualisieren()
   if      ((Ebene = 1) and (NumLock = 0))
      send {blind}{NumpadDel}
   else if ((Ebene = 2) and (NumLock = 1))
      send {blind}{Shift up}{NumpadDel}{Shift down}
   else if (((Ebene = 1) and (NumLock = 1)) or ((Ebene = 2) and (NumLock = 0)))
      if (Ebene = 1)
         send {blind}{NumpadDot}
      else
         send {blind){Shift up}{NumpadDot}{Shift down}
   else if (Ebene = 3)
      send {blind}.
   else if ((Ebene = 4) or (Ebene = 5))
      send `,
return


/*
   ------------------------------------------------------
   Sondertasten
   ------------------------------------------------------
*/
*space::
   if ((einHandNeo))
    spacepressed := 1
   else
    goto neo_SpaceUp
return

*space up::
   if ((einHandNeo))
   {
     if ((keypressed))
     {
       keypressed := 0
       spacepressed := 0    
     }
     else
     {
        goto neo_SpaceUp
     }
   }
   else
     { } ;do nothing
return 

neo_SpaceUp:
     EbeneAktualisieren()
     if      ((Ebene = 1) and !(CheckComp3Uni("r_1",0x2170)          ; r�misch i
                             or CheckComp3Uni("R_1",0x2160)))      ; r�misch I 
        Send {blind}{Space}
     else if  ((Ebene = 2) or (Ebene = 3))
        Send {blind}{Space}
     else if (Ebene = 4)
        if (PriorDeadKey = "c1")            ; circumflex
           BSSendUnicodeChar(0x2070)
        else if (PriorDeadKey = "c5")       ; toter -
           BSSendUnicodeChar(0x2080)
        else
           Send {blind}{NumPad0}
     else if (Ebene = 5)
        SendUnicodeChar(0x00A0)   ; gesch�tztes Leerzeichen
     else if (Ebene = 6)
        SendUnicodeChar(0x202F) ; schmales Leerzeichen
     DeadKey := ""   CompKey := ""
  spacepressed := 0     
  keypressed := 0       
return

/*
   Folgende Tasten sind nur aufgef�hrt, um PriorDeadKey zu leeren.
   Irgendwie sieht das noch nicht sch�n aus. Vielleicht l�sst sich dieses
   Problem irgendwie eleganter l�sen...
   
   Nachtrag:
   Weil es mit Alt+Tab Probleme gab, wird hier jetzt erstmal rumgeflickschustert,
   bis eine allgemeinere L�sung gefunden wurde.
*/

*Enter::
   if (not(lernModus) or lernModus_std_Return)
   {
     send {Blind}{Enter}
     DeadKey := ""   CompKey := ""
   }
return

*Backspace::
   if (not(lernModus) or lernModus_std_Backspace)
   {
     send {Blind}{Backspace}
     DeadKey := ""   CompKey := ""
   }
return

*Del::
   if (not(lernModus) or lernModus_std_Entf)
     send {Blind}{Del}
return

*Ins::
   if (not(lernModus) or lernModus_std_Einf)
     send {Blind}{Ins}
return





/*
Auf Mod3+Tab liegt Compose.
*/

neo_tab:
   if (IsMod3Pressed()) ;#
   {
      #Include *i %a_scriptdir%\ComposeLaunch.ahk
      #Include *i %a_scriptdir%\Source\ComposeLaunch.ahk
      DeadKey := "comp"
      CompKey := ""
   }
   else
   {
      send {blind}{Tab}
      DeadKey := ""
      CompKey := ""
   }
return

*Home::
   if (not(lernModus) or lernModus_std_Pos1)
   {
     send {Blind}{Home}
     DeadKey := ""   CompKey := ""
   }
return

*End::
   if (not(lernModus) or lernModus_std_Ende)
   {
     send {Blind}{End}
     DeadKey := ""   CompKey := ""
   }
return

*PgUp::
   if (not(lernModus) or lernModus_std_PgUp)
   {
     send {Blind}{PgUp}
     DeadKey := ""   CompKey := ""
   }
return

*PgDn::
   if (not(lernModus) or lernModus_std_PgDn)
   {
     send {Blind}{PgDn}
     DeadKey := ""   CompKey := ""
   }
return

*Up::
   if (not(lernModus) or lernModus_std_Hoch)
   {
     send {Blind}{Up}
     DeadKey := ""   CompKey := ""
   }
return

*Down::
   if (not(lernModus) or lernModus_std_Runter)
   {
     send {Blind}{Down}
     DeadKey := ""   CompKey := ""
   }
return

*Left::
   if (not(lernModus) or lernModus_std_Links)
   {
     send {Blind}{Left}
     DeadKey := ""   CompKey := ""
   }
return

*Right::
   if (not(lernModus) or lernModus_std_Rechts)
   {
     send {Blind}{Right}
     DeadKey := ""   CompKey := ""
   }
return





