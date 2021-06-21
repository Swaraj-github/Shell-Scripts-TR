#! usr/bin/bash
#author: Mahendra gayam

clear
red="\033[00;31m"
RED="\033[01;31m"
green="\033[00;32m"
GREEN="\033[01;32m"i
brown="\033[00;33m"
yellow="\033[00;33m"
YELLOW="\033[01;33m"
blue="\033[00;34m"
BLUE="\033[01;34m"
purple="\033[00;35m"
PURPLE="\033[01;35m"
cyan="\033[00;36m"
CYAN="\033[01;36m"
white="\033[00;37m"
WHITE="\033[01;37m"
NC="\033[00m"

echo -e "${NC}"
echo " "

echo -e "${WHITE}******************************************************************************"

echo -e "${WHITE}**                   Setting Passwordless SSH                               **"

echo -e "${RED}********************************************************************************"


echo -e "${NC}"
#cleanup
rm /home/$curuser/scripts/temp/test1.temp 2> /dev/null
rm /home/$curuser/scripts/temp/test2.temp 2> /dev/null


pubcopy(){

echo -e "${yellow}Enter host names you want to access with passwordless SSH from this computer by seperating with spaces ${NC}: \c" && read -a hosts
echo " "
for i in ${hosts[@]}
do
 ssh -q $i " cat /home/$curuser/.ssh/authorized_keys" > /home/$curuser/scripts/temp/test1.temp
 sort /home/$curuser/scripts/temp/test1.temp /home/$curuser/.ssh/id_rsa.pub | uniq -d > /home/$curuser/scripts/temp/test2.temp
 f=`cat /home/$curuser/scripts/temp/test2.temp | wc -m`
 n=`cat /home/$curuser/.ssh/id_rsa.pub | wc -m`
if [ $f == $n ]
 then
  echo " "
 echo -e "${BLUE}ssh passwordless authentication already existed${NC} "
  echo " "
  echo -e "${RED} exited..${NC} "
  echo " "

 else
  echo -e "${BLUE}=======================================================================================================${NC}"
  echo " "
  echo -e " We are logging in ${BLUE} $i${NC} as${BLUE} $curuser ${NC}to set up your public key "
  echo " "
  cat "/home/$curuser/.ssh/id_rsa.pub" | ssh -q "$i" -l "$curuser" '[ -d .ssh ] || mkdir .ssh; cat >> .ssh/authorized_keys; chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys'
  status=$?
 if [ $status -eq 0 ]
  then
    echo " "
    echo -e "${green}Set up completed, try to ssh to${NC}${BLUE} $i ${NC}now "
    echo " "
     echo -e "${BLUE}=======================================================================================================${NC}"
     echo " "
     echo " "
    else
      echo " "
      echo -e "${RED}an error has occured${NC}"
       echo " "
      echo -e "${BLUE}=======================================================================================================${NC}"
      echo " "
      echo " "
      exit
   fi
fi
done

}

curuser=`whoami`
if [ -f /home/$curuser/.ssh/id_rsa.pub ]
then
    echo " "
    echo -e "${green}RSA key exists on /home/$curuser/.ssh/${NC} "
    echo " "
    pubcopy
else
    echo " "
    echo -e "${yellow}RSA key pair not generated, please generate RSA,public key with ssh-keygen${NC}"
    echo " "
    echo -e "${RED}Exited${NC}"
    echo " "
    exit
fi
rm /home/$curuser/scripts/temp/test1.temp 2> /dev/null
rm /home/$curuser/scripts/temp/test2.temp 2> /dev/null

