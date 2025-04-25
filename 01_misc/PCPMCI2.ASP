; PROCOMM PLUS(tm) MCI MAIL ACCESS SYSTEM v1.0
; written by: Tom Smith ++ 7/14/88
;
;  file: PCPMCI2.ASP
;
:  Routines for logging on, getting and sending mail.
;

SET DISPLAY OFF                  ; Inhibit display of logon
SCROLL 0 3 0 20 79 N0
LOCATE 3 0
ATSAY 22 2 N1 "Dialing MCI Mail...                                        "
MDIAL "xxx-xxxx"                 ; **** PLACE TYMNET NUMBER HERE ****
PAUSE 1
IF NOT CONNECTED
   EXECUTE "PCPMCI1.ASP"
ENDIF
ATSAY 22 2 N1 "Connected. Sending ID and password...                      "

PAUSE 3                          ; Wait a bit
TRANSMIT "A"                     ; Send the terminal ID
WAITFOR "please log in:" 10      ; Wait for prompt
TRANSMIT "mcimail^M"             ; Ask for MCIMAIL
WAITFOR "user name:" 10          ; Wait for prompt
TRANSMIT "xxxxxxxxx"             ; Send ID  **** ENTER ID HERE ****
TRANSMIT "^M"                    ; Send CR
WAITFOR "Password:" 10           ; Waitfor prompt
TRANSMIT "xxxxxxxx"              ; Send PASSWORD **** ENTER PASSWORD HERE ****
TRANSMIT "^M"                    ; Send CR

IF NOT CONNECTED
   EXECUTE "PCPMCI1.ASP"
ENDIF

WAITFOR "Opened."
SET DISPLAY ON                   ; Resume display

WAITFOR "MCI Mail Version 4.0^M^J ^M^J    "   ; Wait for prompt

RGET S3                          ; Get mail message
WAITFOR "EXIT):"                 ; Wait for prompt

FIND S3 "no messages"            ; Check string for target
IF FOUND                         ; If no msgs
   INIT N3 0                     ; Set flag to NO
   ASSIGN S9 "There are no messages in your INBOX."
ELSE
   INIT N3 1                     ; Set flag to YES
ENDIF

IF EQ N3 1                       ; If messages exist
   IF EQ N4 1                    ; and told to get them
      ATSAY 22 2 N1 "Retrieving messages...                                     "
      TRANSMIT "PRINT^M"
      WAITFOR "EXIT):"                 ; Wait for prompt
      TRANSMIT "INBOX^M"
      LOG OPEN "PCPMCI.IN"
      WAITFOR "You may enter:"  32000  ; Wait for prompt
      LOG CLOSE
      WAITFOR "EXIT):"                 ; Wait for prompt
      ASSIGN S9 "You have messages in your INBOX."
   ENDIF
ENDIF

IF EQ N5 1                       ; If flagged to send messages
   CLEAR
   LOCATE 0 0
   SET DISPLAY OFF
   SENDFILE ASCII "PCPMCI.SND"
   DOS "COPY PCPMCI.OUT+PCPMCI.SND PCPMCI.OUT"
   DOS "DEL PCPMCI.SND"
   CLEAR
   BOX 0 0 2 79 N1
   BOX 21 0 23 79 N1
   ATSAY 1 2 N1 "PROCOMM PLUS MCI Mail System                                                "
   ATSAY 22 2 N1 "Messages sent.                                             "
   WAITFOR "or EXIT):"
   LOCATE 3 0
   SET DISPLAY ON
   ASSIGN S9 "At your command...
   WAITFOR "or EXIT):"
ENDIF

IF EQ N6 1                       ; If flagged to logon
   ATSAY 22 2 N1 "Enter EXIT to logoff...                                   "
   WAITFOR "please log in:" 3600 ; Wait 1 hour max
ELSE
   ATSAY 22 2 N1 "Logging off...                                             "
   TRANSMIT "EXIT^M"             ; Issue logout
   WAITFOR "please log in:"
ENDIF

ATSAY 22 2 N1 "Disconnecting...                                           "
HANGUP                           ; Hangup for TYMNET
RFLUSH

EXECUTE "PCPMCI1.ASP"
