;*************************************************************************
;* FIDO.ASP  (C) 1987 DATASTORM TECHNOLOGIES, INC.                       *
;*                                                                       *
;* A sample ASPECT script file for logging onto FIDO Bulletin Boards.    *
;*                                                                       *
;*************************************************************************

CLEAR
LOCATE 0 0
BOX 0 0 4 23 14
ATSAY 2 2 14 "Logging onto FIDO..."
LOCATE 6 0

IF NOT LINKED
   DIAL "6"                  ;set to your dial dir entry for FIDO
ENDIF

PAUSE 1
TRANSMIT " "
PAUSE 1
TRANSMIT " "

WAITFOR "FIRST"              ;wait for first name prompt
PAUSE 1
TRANSMIT "FIRSTNAME^M"       ;send your first name

WAITFOR "LAST"               ;wait for last name prompt
PAUSE 1
TRANSMIT "LASTNAME^M"

WAITFOR "]"                  ;wait for confirmation prompt
PAUSE 1
TRANSMIT "Y^M"               ;confirm it

WAITFOR "Password: "         ;wait for password prompt
PAUSE 1
SEND "PASSWORD^M"

ALARM 2                      ;inform user logon complete

