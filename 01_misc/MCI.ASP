; PROCOMM PLUS(tm) MCI MAIL ACCESS SYSTEM v1.0
; written by: Tom Smith ++ 7/14/88
;
;  file: MCI.ASP
;
:  Entry point for system, performs initializations then
;  calls menu.
;
;  ATTENTION: Be sure to read PCPMCI.DOC and perform customizations
;  before attempting to use this system.
;

CLEAR
MESSAGE "Initializing..."
HANGUP

SET PARITY EVEN                  ; Set line settings
SET DATABITS 7
SET DUPLEX FULL
SET BAUD 1200                    ; **** ENTER BAUD RATE HERE ****
SET ENQ OFF
SET ASCII BLANKEX OFF            ; Configure ASCII upload settings
SET ASCII CHARPACE 20            ; you may want to adjust CHARPACE and
;SET ASCII LINEPACE 20            ; LINEPACE depending on your machine
SET ASCII PACECHAR 13
SET ASCII ECHO OFF
SET ASCII UP_CR CR
SET ASCII UP_LF STRIP
SET ASCII DN_CR CR
SET ASCII DN_LF LF

EMULATE VT102                      ; set terminal type to use scroll region
TRANSMIT "ATE1^M"                  ; the following lines use modem echo to
WAITFOR "OK"                       ; trick PCPLUS into using a scroll region
TRANSMIT "^[[?6h"                  ; set origin
PAUSE 1
TRANSMIT "^[[4;21r"                ; set scroll region

WHEN "Press <RETURN>" "~^M"        ; Take care of paging
SET ATIME 0                        ; Reset alarm time to zero
ASSIGN S9 "At your command..."     ; initial message

IF MONO                            ; set colors for different monitors
   INIT N0 7                       ; Normal
   INIT N1 15                      ; Bold
   INIT N2 112                     ; Reverse
   INIT N7 113                     ; Reverse bold
ELSE
   INIT N0 23
   INIT N1 31
   INIT N2 113
   INIT N7 116
ENDIF

EXECUTE "PCPMCI1.ASP"              ; call the menu
