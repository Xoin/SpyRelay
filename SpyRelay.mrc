;                   _____             _____      _             
;                  / ____|           |  __ \    | |            
;                 | (___  _ __  _   _| |__) |___| | __ _ _   _ 
;                  \___ \| '_ \| | | |  _  // _ \ |/ _` | | | |
;                  ____) | |_) | |_| | | \ \  __/ | (_| | |_| |
;                 |_____/| .__/ \__, |_|  \_\___|_|\__,_|\__, |
;                        | |     __/ |                    __/ |
;                        |_|    |___/                    |___/ 
;
;   IF YOU USE THIS ON A VERY ACTIVE CHANNEL IT WILL BE LIKELY THAT YOU WILL
;   GET BANNED FOR SPAM, RECOMMEND IS TO JUST USE A SERVER THAT DOES NOT CARE
;
;   This script will echo everything that is said in channel(s) to a different 
;   server. It is a basic version of the SpyRelay IRC bot, which has more 
;   options. I'm sure you will know why you want to use this :).
;
;   This script should be added to the remote tab of the mIRC script editor
;
;   Things you have to do everytime you start mIRC
;
;   1) connect to the first server
;   2) create a new window and login to another irc server
;   3) use /spy to automaticly find the second window
;
;   Things you just have to do once (unless you want to add more channels)
;
;   1) Edit this script in the section where it says you should edit it.
;

alias spy {
  VAR %ctr = 0
  VAR %tot = $scon(0)
  WHILE (%ctr < %tot) {
    INC %ctr
    scon %ctr
    set %server_CID $cid
  }
  echo -a Second server CID set as: %server_CID
}

on *:text:*:#: {
   ; ********************************************************************       
   ;   START EDIT HERE START EDIT HERE START EDIT HERE START EDIT HERE
   ; ********************************************************************       

   ;Ammount of channels you want to be in
    VAR %watch_ammount = 1
   ;Channels you want to watch
    VAR %watch_channel.1 = #channel1
   ;VAR %watch_channel.2 = #channel2

   ; Channel that should recieve everything
    VAR %server_channel = #main

   ; ********************************************************************       
   ;     STOP EDIT HERE STOP EDIT HERE STOP EDIT HERE STOP EDIT HERE     
   ; ********************************************************************       

    var %x = 1
    while (%x <= %watch_ammount) {
        if ($chan == %watch_channel. [ $+ [ %x ] ]) {
            scid -tM %server_CID msg %server_channel < $+ %watch_channel. [ $+ [ %x ] ] $nick $+ > $1-
        }
        inc %x
    }
}
