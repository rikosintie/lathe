;*************************************************************************
;* PCBOARD.ASP  (C) 1987 DATASTORM TECHNOLOGIES, INC.                    *
;*                                                                       *
;* A sample ASPECT script file for logging on to PC-Board bulletin       *
;* board systems.                                                        *
;*                                                                       *
;*************************************************************************

CLEAR
LOCATE 0 0
BOX 0 0 4 26 14
ATSAY 2 2 14 "Logging onto PCBOARD..."
LOCATE 6 0

IF NOT LINKED
   DIAL "4"                  ;set to your dial dir entry for PCBOARD
ENDIF

EMULATE ANSI                           ; ANSI emulation for colors

TRANSMIT "Y^M"                         ; tell it you want graphics
                                       ; change to "N" for no graphics

WAITFOR "first name? "                 ; wait for first name prompt
PAUSE 1                                ; pause 1 second
TRANSMIT "JOHN^M"                      ; PUT YOUR FIRST NAME HERE

WAITFOR "last name? "                  ; wait for last name prompt
PAUSE 1                                ; pause 1 second
TRANSMIT "DOE^M"                       ; PUT YOUR LAST NAME HERE

WAITFOR "will echo)? "                 ; wait for password prompt
PAUSE 1                                ; pause 1 second
TRANSMIT "PASSWORD^M"                  ; PUT YOUR PASSWORD HERE

ALARM 2                                ; inform user logon is complete

