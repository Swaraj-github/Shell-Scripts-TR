#Author : Sumit KHajanchi

main(){
echo -e "${BLUE}Main menu ${NC}"
echo " "

echo " 1.Check the status of the SDP application "
echo " 2.Check the status of the SB application in Venus "
echo " 3.Check the status of the SB application in Neptune"
echo " 4.Check the status of the Acorn Pre-Prod application in Venus"
echo " 5.Check the status of the Acorn Prod application in Mercury"
echo " 6.Check the status of the Acorn Prod application in Neptune"
echo " 7 .Exit "

echo " "
echo -e " ${yellow}Please select your option here ${NC}: \c" && read option
case $option in
"1")
     echo " "
		ssh -q c391trh.int.thomsonreuters.com "sh /home/asadmin/scripts/SDPapp_Status.sh"
		echo -e "${yellow} press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
		echo " "
		case $subop in
		"1")
			clear
			main
        ;;

		"2")
         echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
       *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
      esac

     ;;

"2")
     echo " "
		ssh -q c291mqx.int.thomsonreuters.com "sh /home/asadmin/scripts/SBappstatus_Venus.sh"
		echo -e "${yellow} press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
		echo " "
		case $subop in
		"1")
			clear
			main
        ;;

		"2")
         echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
       *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
      esac

     ;;
"3")
     echo " "
		ssh -q c991wpgniegne.int.thomsonreuters.com "sh /home/asadmin/scripts/SBappstatus_Neptune.sh"
		echo -e "${yellow} press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
		echo " "
		case $subop in
		"1")
			clear
			main
        ;;

		"2")
         echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
       *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
      esac

     ;;

"4")
     echo " "
		ssh -q c018mbuqeddoc.int.thomsonreuters.com "sh /home/asadmin/scripts/yarn_status.sh"
		echo -e "${yellow} press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
		echo " "
		case $subop in
		"1")
			clear
			main
        ;;

		"2")
         echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
       *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
      esac

     ;;

"5")
     echo " "
		ssh -q c890xccniegmf.int.thomsonreuters.com " sh /home/asadmin/scripts/yarn_status.sh "
		echo -e "${yellow} press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
		echo " "
		case $subop in
		"1")
			clear
			main
        ;;

		"2")
         echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
       *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
      esac

     ;;

"6")
     echo " "
		ssh -q c777czfniegme.int.thomsonreuters.com " sh /home/asadmin/scripts/yarn_status.sh "
		echo -e "${yellow} press 1 to go to Main Menu or press 2 to exit (1/2)?${NC} : \c" && read subop
		echo " "
		case $subop in
		"1")
			clear
			main
        ;;

		"2")
         echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
       *)
        echo " you have entered invalid option "
        echo " "
         echo -e "${RED} exited... ${NC}"
         echo " "
         ;;
      esac

     ;;

"7")
    echo " "
    echo -e "${RED} exited ... ${NC}"
    echo " "
    exit
    ;;

*)

      echo " you have selected invalid option "
      echo " exited......"
      echo " "
      exit
    ;;

 esac
}
main

