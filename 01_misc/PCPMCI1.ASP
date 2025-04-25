; PROCOMM PLUS(tm) MCI MAIL ACCESS SYSTEM v1.0
; written by: Tom Smith ++ 7/14/88
;
;  file: PCPMCI1.ASP
;
:  Main polling loop.
;

CLEAR N0

INIT N3 0                        ; initialize flags
INIT N4 0
INIT N5 0
INIT N6 0

BOX 0 0 2 79 N1                  ; Build the screen
BOX 21 0 23 79 N1
LOCATE 3 0                       ; Position cursor

LABEL1:

ATSAY 1 2 N1 "PROCOMM PLUS MCI Mail System                                                "
ATSAY 22 2 N1 "GET   READ   CREATE   SEND   LOGON   DOS   HELP   QUIT     "

ISFILE "PCPMCI.IN"               ; Check for existing mail to read
IF SUCCESS
   ATSAY 1 67 N2 "READ"
ENDIF

ISFILE "PCPMCI.SND"              ; Check for existing mail to send
IF SUCCESS
   ATSAY 1 74 N2 "SEND"
ENDIF

MESSAGE S9                       ; Display message
SET MENUMODE ON                  ; Trap ESC key
KEYGET S0                        ; Get option
SET MENUMODE OFF
SWITCH S0                        ; Switch on option
   CASE "G"                      ; GET MAIL
      INIT N4 1
      ISFILE "PCPMCI.SND"
      IF SUCCESS
         MESSAGE "Send messages as well?"
         ATSAY 22 2 N1 "YES    NO                                                  "
         KEYGET S0
         FIND S0 "Y"
         IF FOUND
            INIT N5 1
         ENDIF
      ENDIF
      EXECUTE "PCPMCI2.ASP"
   ENDCASE
   CASE "R"                      ; READ MAIL
      ISFILE "PCPMCI.IN"
      IF SUCCESS
         DOS "PCEDIT PCPMCI.IN"
         MESSAGE "Disposition of INBOX?"
         ATSAY 22 2 N1 "PRINT   DELETE   MENU                                           "
         SET MENUMODE ON
         KEYGET S0
         SET MENUMODE OFF
         SWITCH S0
            CASE  "P"
               DOS "COPY PCPMCI.IN PRN"
            ENDCASE
            CASE "D"
               DOS "TYPE PCPMCI.IN >> PCPMCI.DSK"
               DOS "DEL PCPMCI.IN"
               ASSIGN S9 "INBOX cleared, messages added to DESK."
            ENDCASE
         ENDSWITCH
      ELSE
         ASSIGN S9 "No messages in your INBOX."
      ENDIF
   ENDCASE
   CASE "C"                      ; CREATE MAIL
      EXECUTE "PCPMCI4.ASP"
   ENDCASE
   CASE "S"                      ; SEND MAIL
      INIT N5 1
      ISFILE "PCPMCI.SND"
      IF SUCCESS
         MESSAGE "Get messages if available?"
         ATSAY 22 2 N1 "YES    NO                                                  "
         KEYGET S0
         FIND S0 "Y"
         IF FOUND
            INIT N4 1
         ENDIF
         EXECUTE "PCPMCI2.ASP"
         ASSIGN S9 "Messages sent."
      ELSE
         ASSIGN S9 "No messages to send."
      ENDIF
   ENDCASE
   CASE "L"                      ; LOGON
      INIT N6 1
      EXECUTE "PCPMCI2.ASP"
   ENDCASE
   CASE "D"                      ; GO TO DOS
      SHELL
      ASSIGN S9 "At your command..."
   ENDCASE
   CASE "H"                      ; DISPLAY HELP
      EXECUTE PCPMCI3.ASP"
      ASSIGN S9 "At your command..."
   ENDCASE
   CASE "Q"                      ; GO BYE BYE
      CLEAR
      EMULATE VT102              ; Resets scroll stuff
      EXIT
   ENDCASE
ENDSWITCH
GOTO LABEL1
