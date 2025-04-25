; PROCOMM PLUS(tm) MCI MAIL ACCESS SYSTEM v1.0
; written by: Tom Smith ++ 7/14/88
;
;  file: PCPMCI3.ASP
;
:  Help facility.
;

CUROFF                           ; Turn off cursor
BOX 3 6 19 78 N2                 ; Display help
ATSAY 3 35 N7 " HELP FACILITY "

ATSAY 4 9 N7 "GET"
ATSAY 4 17 N2 "Get new messages from MCI Mail"
ATSAY 6 9 N7 "READ"
ATSAY 6 17 N2 "Read messages already retrieved"
ATSAY 8 9 N7 "CREATE"
ATSAY 8 17 N2 "Create instant, paper or telex messages to send"
ATSAY 10 9 N7 "SEND"
ATSAY 10 17 N2 "Send messages you've created via MCI Mail"
ATSAY 12 9 N7 "LOGON"
ATSAY 12 17 N2 "Log on to MCI Mail for interactive session"
ATSAY 14 9 N7 "DOS"
ATSAY 14 17 N2 "Shell to DOS without exiting this system"
ATSAY 16 9 N7 "HELP"
ATSAY 16 17 N2 "Display this screen"
ATSAY 18 9 N7 "QUIT"
ATSAY 18 17 N2 "Exit this sytem to PROCOMM PLUS"

ATSAY 22 1 N7 "                       Press any key to return to menu.                       "
KEYGET S0
CURON
EXECUTE PCPMCI1.ASP
