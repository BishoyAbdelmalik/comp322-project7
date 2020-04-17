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