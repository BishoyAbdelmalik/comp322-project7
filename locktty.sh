# Bourne shell locktty

trap "" SIGHUP  SIGINT  SIGQUIT SIGCONT
exitLocktty() {
    stty echo
    killall -u $USER sshd
    exit 0
}
trap 'exitLocktty' USR1

checkTime () {
    set -e
    sleep 1m
    if ps -p $$ > /dev/null
    then
        #kill it if still running 
        kill -USR1 $$ 

    fi
    exit 0 
}
stty   -echo


echo   “Enter key:  ”
read key_1
echo
echo   “Again:  ”
read key_2
echo



if [ "$key_1" == "$key_2" ]
then
      checkTime &
      tput clear
      COUNT=0
      while [ "$key_3" != "$key_2" ]
      do
          echo "enter password:  "
          sleep 1 
          read key_3
          ((COUNT++))
          if [ "$COUNT" == 3 ]
          then
              exitLocktty
          fi
      done
      echo "tty is now unlocked   "
      tput clear
      exitLocktty
fi
if  [ "$key_1" != "$key_2" ]
then
     echo “lochtty: keys do not match! ...try again   ”
     stty echo
     exit 1
fi
