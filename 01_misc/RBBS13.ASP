;*************************************************************************
;* RBBS13.ASP  (C) 1987 DATASTORM TECHNOLOGIES, INC.                     *
;*                                                                       *
;* A sample ASPECT script file for logging onto RBBS version 13.1A       *
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

PAUSE 1
TRANSMIT "^M"

WAITFOR "What is your FIRST Name?"
TRANSMIT "FIRSTNAME;LASTNAME;FAKE-PASSWORD^M"

ALARM 2                      ;inform user logon complete

