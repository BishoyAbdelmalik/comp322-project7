# comp322 Project 7

Modify the above locktty script so that the new user has only 3 attempts to reinstate the session, and furthermore, it has to be done within 15 minutes (for testing purposes you should reduce it to 1 - 2 mins, so that you don’t waste time waiting).


For an extra credit, you should add to the script a command that will terminate the connection with the server.

### Original Locktty Script 
---
 ```bash
 # Bourne shell locktty

trap ‘‘ 1  2  3  18

stty   -echo
echo   “Enter key:  ”
read key_1
echo
echo   “Again:  ”
read key_2
echo

if [ "$key_1" == "$key_2" ]
then
      tput clear
      while [ "$key_3" != "$key_2" ]
      do
          echo "enter password:  "
          sleep 1

          read key_3
      done
      echo "tty is now unlocked   "
      tput clear
      stty echo
      exit 0
fi
if  [ "$key_1" != "$key_2" ]
then
     echo “lochtty: keys do not match! ...try again   ”
     stty echo
     exit 1
fi
```