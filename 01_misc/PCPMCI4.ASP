; PROCOMM PLUS(tm) MCI MAIL ACCESS SYSTEM v1.0
; written by: Tom Smith ++ 7/14/88
;
;  file: PCPMCI4.ASP
;
:  Creates messages.
;

ATSAY 22 2 N1 "INSTANT   PAPER   TELEX                                    "

KEYGET S0                        ; Get choice
SWITCH S0
   CASE "I"                      ; Instant
      SCROLL 0 3 0 20 79 N0
      ATSAY 22 2 N1 "Creating instant message.                                  "
      ATSAY 3 0 N1 "TO: "
      ATGET 3 4 N2 30 S4
      STRCAT S4 " (INSTANT)"
      ATSAY 5 0 N1 "SUBJECT: "
      ATGET 5 9 N2 30 S5
      DOS "PCEDIT PCPMCI.$$2"
      LOCATE 7 0
      MESSAGE "Disposition of message?"
      ATSAY 22 2 N1 "SAVE   ABORT                                               "
      KEYGET S0
      SWITCH S0
         CASE "A"
            ASSIGN S9 "At your command..."
            EXECUTE "PCPMCI1.ASP"
         ENDCASE
         DEFAULT
            FOPENO "PCPMCI.$$1" TEXT
            FPUTS "CREATE"
            FPUTC "^J"
            FPUTS S4
            FPUTC "^J"
            FPUTC "^J"
            FPUTC "^J"
            FPUTS S5
            FPUTC "^J"
            FCLOSEO
            FOPENO "PCPMCI.$$3" TEXT
            FPUTS "/"
            FPUTC "^J"
            FPUTS "SEND"
            FPUTC "^J"
            FCLOSEO
            DOS "COPY PCPMCI.SND+PCPMCI.$$1+PCPMCI.$$2+PCPMCI.$$3 PCPMCI.SND"
            DOS "DEL PCPMCI.$$*"
            ASSIGN S9 "Message ready to send."
         ENDCASE
      ENDSWITCH
   ENDCASE
   CASE "P"                      ; Paper
      SCROLL 0 3 0 20 79 N0
      ATSAY 22 2 N1 "Creating paper message.                                  "
      ATSAY 3 0 N1 "TO: "
      ATSAY 4 0 N1 "COUNTRY: "
      ATSAY 5 0 N1 "TITLE/CO:"
      ATSAY 6 0 N1 "ADDRESS 1:"
      ATSAY 7 0 N1 "ADDRESS 2:"
      ATSAY 8 0 N1 "CITY: "
      ATSAY 9 0 N1 "STATE: "
      ATSAY 10 0 N1 "ZIP: "
      ATGET 3 11 N2 30 S1
      STRCAT S1 " (PAPER)"
      ATGET 4 11 N2 30 S2
      ATGET 5 11 N2 30 S3
      ATGET 6 11 N2 30 S4
      ATGET 7 11 N2 30 S5
      ATGET 8 11 N2 30 S6
      ATGET 9 11 N2 30 S7
      ATGET 10 11 N2 30 S8
      ATSAY 12 0 N1 "SUBJECT: "
      ATGET 12 11 N2 30 S9
      DOS "PCEDIT PCPMCI.$$2"
      LOCATE 13 0
      MESSAGE "Disposition of message?"
      ATSAY 22 2 N1 "SAVE   ABORT                                               "
      KEYGET S0
      SWITCH S0
         CASE "A"
            ASSIGN S9 "At your command..."
            EXECUTE "PCPMCI1.ASP"
         ENDCASE
         DEFAULT
            FOPENO "PCPMCI.$$1" TEXT
            FPUTS "CREATE"
            FPUTC "^J"
            FPUTS S1
            FPUTC "^J"
            FPUTS S2
            FPUTC "^J"
            FPUTS S3
            FPUTC "^J"
            FPUTS S4
            FPUTC "^J"
            FPUTS S5
            FPUTC "^J"
            FPUTS S6
            FPUTC "^J"
            FPUTS S7
            FPUTC "^J"
            FPUTS S8
            FPUTC "^J"
            FPUTC "Y"
            FPUTC "^J"
            FPUTC "^J"
            FPUTC "^J"
            FPUTS S9
            FPUTC "^J"
            FCLOSEO
            FOPENO "PCPMCI.$$3" TEXT
            FPUTS "/"
            FPUTC "^J"
            FPUTS "SEND"
            FPUTC "^J"
            FCLOSEO
            DOS "COPY PCPMCI.SND+PCPMCI.$$1+PCPMCI.$$2+PCPMCI.$$3 PCPMCI.SND"
            DOS "DEL PCPMCI.$$*"
            ASSIGN S9 "Message ready to send."
         ENDCASE
      ENDSWITCH
   ENDCASE
   CASE "T"                      ; TELEX
      MESSAGE "Not yet implemented"
      SOUND 440 20
      PAUSE 2
   ENDCASE
ENDSWITCH

EXECUTE "PCPMCI1.ASP"
