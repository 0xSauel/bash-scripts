#!/bin/bash
#Author: 0xSauel
#Version: over9001
#Kill me anybody :D
green='\x1B[0;32m'
nc='\x1B[0m'
echo "Script working only with Skype database version <12.X"
echo -e "Usually path to database is $green~/.Skype/skypeusername/main.db$nc" 
echo -e "For Windows users: $green%appdata%/Skype/skypeusername/main.db$nc"
read -p "Enter path to main.db file: " path
read -p "Choose delimiter (delimiter shouldn't be used in chatnames, usernames, messages): " demiter
read -p "Enter chatname if you want to export specific chat(i.e.: My chat room) or leave it blank if you want to export whole history: " gr
read -p "Where can I put logs? (relative or absolute path with filename.csv on the end): " logpath
echo "Processing..."
#exporting convertsations logs from skype db
sqlite3 -separator $demiter $path "SELECT timestamp, displayname, author, body_xml FROM Conversations, Messages WHERE Conversations.identity = Messages.chatname AND Messages.chatname LIKE '%thread%' ORDER BY timestamp;" | grep "$gr" > ~/temp.csv &&
#get rid of xml formatting in messages (skype feature)
sed -i -e 's/<[^>]*>//g' ~/temp.csv &&
#and \r symbols
sed -i -e 's/\r//g' ~/temp.csv &&
#now change \n for " " in messages
sed -i -e :a -e "$!N; s/\n\([^$demiter]*\)$/ \1/; ta" -e 'P;D' ~/temp.csv && #Thanks to steeldriver from unix.stackexchange.com for helping with this part!
#making all columns quoted
awk -v q="\"" -v d="$demiter" 'BEGIN {FS = d}; {print q $1 q FS q $2 q FS q $3 q FS q $4 q}' ~/temp.csv > $logpath &&
#remove temp file
rm -r ~/temp.csv
echo "Done!"

