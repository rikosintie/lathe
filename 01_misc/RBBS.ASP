;*************************************************************************
;* RBBS.ASP  (C) 1987 DATASTORM TECHNOLOGIES, INC.                       *
;*                                                                       *
;* A sample ASPECT script file for logging onto RBBS bulletin boards.    *
;*                                                                       *
;*************************************************************************

CLEAR
LOCATE 0 0
BOX 0 0 4 23 14
ATSAY 2 2 14 "Logging onto RBBS..."
LOCATE 6 0

IF NOT LINKED
   DIAL "4"                  ;set to your dial dir entry for RBBS
ENDIF

WAITFOR "More (Y)"           ;wait for prompt
TRANSMIT "N^M"               ;send "NO"

WAITFOR "Name"               ;wait for name prompt
TRANSMIT "FIRSTNAME;LASTNAME;PASSWORD^M"

ALARM 2                      ;inform user logon complete

