#!/bin/bash
#Author : Mahendra Gayam
echo " "

echo " "

echo " "
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

echo -e "${WHITE}******************************************************************************"

echo -e "${WHITE}**              HBASE authentication check script                           **"

echo -e "${RED}********************************************************************************"


echo -e "${NC}"

venus()
{
#echo -e "${BLUE}Connecting to Hbase....${NC}"
ssh -q c169rad.int.thomsonreuters.com "sh /home/asadmin/scripts/hbase_auth_check.sh"
echo -e ${yellow}" press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
     echo " "
     case $subop in
       "1")
         clear
         main
         ;;

       "2")
         echo " "
         echo -e "${RED}   exited... ${NC}"
         echo " "
         ;;
        *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED}  exited... ${NC}"
         echo " "
         ;;
       esac
     

}

mercury()
{
#echo -e "${BLUE}Connecting to Hbase....${NC}"
ssh -q c243ytaniegmf.int.thomsonreuters.com "sh /home/asadmin/scripts/hbase_auth_check.sh"
echo -e ${yellow}" press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
     echo " "
     case $subop in
       "1")
          
         clear
         main
         ;;

       "2")
         echo " "
         echo -e "${RED}   exited... ${NC}"
         echo " "
         ;;
        *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED}  exited... ${NC}"
         echo " "
         ;;
       esac
      

}

neptune()
{
#echo -e "${BLUE}Connecting to Hbase....${NC}"

ssh -q c244edrniegne.int.thomsonreuters.com "sh /home/asadmin/scripts/hbase_auth_check.sh"
echo -e ${yellow}" press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
     echo " "
     case $subop in
       "1")
          
        clear
         main
         ;;

       "2")
         echo " "
         echo -e "${RED}   exited... ${NC}"
         echo " "
         ;;
        *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED}  exited... ${NC}"
         echo " "
         ;;
       esac
     

}
main()

{

echo -e " ${RED}select your cluster${NC}"
echo " "
echo " 1.Venus "
echo " 2.Mercury"
echo " 3.Neptune"
echo " 4.Exit"
echo " "
echo -e "${RED}Please select your option here :${NC} \c" && read opt
echo " "
case $opt in

     "1")

           venus
        ;;

    "2" )
           mercury
        ;;

    "3" )

          neptune
       ;;

     "4")

         echo " "
         echo " Exited "
         echo " "
         exit
        ;;

      *)
         echo " "
         echo "Invalid option "
         echo " "
         exit
       ;;
esac
}

main

