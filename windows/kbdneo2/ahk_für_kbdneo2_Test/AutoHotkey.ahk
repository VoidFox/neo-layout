;VKe2 ist VK_OEM_102
;�Bild auf�
~vke2 & 4::Sendinput {Blind}{PGUP}
;Cursor �Hoch�
~vke2 & l::Sendinput {Blind}{UP}
;�Entfernen�
~vke2 & c::Sendinput {Blind}{DEL}
;�Einf�gen�
~vke2 & w::Sendinput {Blind}{INS}
;�Pos1�
~vke2 & u::Sendinput {Blind}{HOME}
;Cursor �Links�
~vke2 & i::Sendinput {Blind}{LEFT}
;Cursor �Runter�
~vke2 & a::Sendinput {Blind}{DOWN}
;Cursor �Rechts�
~vke2 & e::Sendinput {Blind}{RIGHT}
;�Ende�
~vke2 & o::Sendinput {Blind}{END}
;�Bild ab�
~vke2 & '::Sendinput {Blind}{PGUP}
;�Tab� damit Tab+Shift funzt
vke2 & *]::send {blind}{Tab}		

;RShift wenn vorher LShift gedr�ckt wurde
LShift & ~RShift::	
      if GetKeyState("CapsLock","T")
      {
         setcapslockstate, off
      }
      else
      {
         setcapslockstate, on
      }
return

;LShift wenn vorher RShift gedr�ckt wurde
RShift & ~LShift::
      if GetKeyState("CapsLock","T")
      {
         setcapslockstate, off
      }
      else
      {
         setcapslockstate, on
      }
return


