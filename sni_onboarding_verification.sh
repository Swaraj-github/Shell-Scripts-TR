#! /bin/bash
#Author : Mahendra gayam

clear
echo " "
red="\033[00;31m"
RED="\033[01;31m"
yellow="\033[00;33m"
YELLOW="\033[01;33m"
blue="\033[00;34m"
BLUE="\033[01;34m"
NC="\033[00m"


echo -e "${NC}"

echo -e "${WHITE}****************************************************************************"

echo -e "${WHITE}**             SNI Collection Onboard verification script                 **"

echo -e "${RED}******************************************************************************"

echo -e "${NC}"

echo " "

venuskey=`curl --silent -u s.CASK.CDAP.QED:N2aehwf3V73X5KFR http://demo-cdap-venus.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`
mercurykey=`curl --silent -u s.CASK.CDAP.PROD:KXP4wiFCywoe9999 http://prod-cdap-mercury.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`
neptunekey=`curl --silent -u s.CASK.CDAP.PROD:KXP4wiFCywoe9999 http://prod-cdap-neptune.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`


echo " "

easelauxflagvalidation()
 {
echo -e "${YELLOW} Please enter the change number to check the  Easel Aux flag status${NC} : \c" && read dirname
ssh -q novus@burlison.westlan.com " cd /novus/loadUtil/cciUtil/RiptideConfig/$dirname && grep -A50 'Connection Information:' UpdateRiptideConfig_update.log" | awk -F '  ' '{print $2}'

 }

venuscollectionvalidation()
{


echo -e "${YELLOW} Please enter the Namespace ${NC} : \c" && read namespace
echo -e "${YELLOW} Please enter the collection Type${NC} : \c" && read ctype
echo -e "${yellow} Please enter the collection names to check ${NC} : \c" && read -a collectionnames
echo " "

echo -e "${YELLOW}List of Collections not available in Hbase S-Cloumn family:${NC}"

  curl --silent -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/$namespace/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/$ctype  >> /home/asadmin/scripts/temp/venuscollectionvalidation1.txt &&

for collectionname in "${collectionnames[@]}";
do

  vens=`cat /home/asadmin/scripts/temp/venuscollectionvalidation1.txt | grep -A5 $collectionname | grep true |wc -l`
  if [ "$vens" = 0 ]
   then
   echo -e "${blue}$collectionname is not available in S-column Family.${NC} \n"
  # else
  # echo -e "${RED} $collectionname is not available in S-Column family ${NC} \n"
 fi

done
echo " "

echo -e "${YELLOW}List of collections not available in NovusDB Queue table: ${NC}"

  curl --silent -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/$namespace/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/collection/consumer/all  >> /home/asadmin/scripts/temp/venuscollectionvalidation2.txt &&

for collectionname in "${collectionnames[@]}";
do

  vensql=`cat /home/asadmin/scripts/temp/venuscollectionvalidation2.txt | grep $collectionname |wc -l`
  if [ "$vensql" = 0 ]
   then
   echo -e "${blue}$collectionname is not available in Novus DB.${NC} \n"
  # else
  # echo -e "${RED} $collectionname is not available in Novus DB ${NC} \n"
 fi

done

rm /home/asadmin/scripts/temp/venuscollectionvalidation1.txt
rm /home/asadmin/scripts/temp/venuscollectionvalidation2.txt

}



mercurycollectionvalidation()
{


echo -e "${YELLOW} Please enter the Namespace ${NC} : \c" && read namespace
echo -e "${YELLOW} Please enter the collection Type${NC} : \c" && read ctype
echo -e "${yellow} Please enter the collection names to check ${NC} : \c" && read -a collectionnames
echo " "

echo -e "${YELLOW}List of Collections not available in Hbase S-Cloumn family:${NC}"

  curl --silent -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/$namespace/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/$ctype  >> /home/asadmin/scripts/temp/mercurycollectionvalidation1.txt &&

for collectionname in "${collectionnames[@]}";
do

  mers=`cat /home/asadmin/scripts/temp/mercurycollectionvalidation1.txt | grep -A5 $collectionname | grep true |wc -l`
  if [ "$mers" = 0 ]
   then
   echo -e "${blue}$collectionname is not available in S-column Family.${NC} \n"
  # else
  # echo -e "${RED} $collectionname is not available in S-Column family ${NC} \n"
 fi

done
echo " "

echo -e "${YELLOW}List of collections not available in NovusDB Queue table: ${NC}"

  curl --silent -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/$namespace/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/collection/consumer/all  >> /home/asadmin/scripts/temp/mercurycollectionvalidation2.txt &&

for collectionname in "${collectionnames[@]}";
do

  mersql=`cat /home/asadmin/scripts/temp/mercurycollectionvalidation2.txt | grep $collectionname |wc -l`
  if [ "$mersql" = 0 ]
   then
   echo -e "${blue}$collectionname is not available in Novus DB.${NC} \n"
  # else
  # echo -e "${RED} $collectionname is not available in Novus DB ${NC} \n"
 fi

done

rm /home/asadmin/scripts/temp/mercurycollectionvalidation1.txt
rm /home/asadmin/scripts/temp/mercurycollectionvalidation2.txt

}


neptunecollectionvalidation()
{


echo -e "${YELLOW} Please enter the Namespace ${NC} : \c" && read namespace
echo -e "${YELLOW} Please enter the collection Type${NC} : \c" && read ctype
echo -e "${yellow} Please enter the collection names to check ${NC} : \c" && read -a collectionnames
echo " "

echo -e "${YELLOW}List of Collections not available in Hbase S-Cloumn family:${NC}"

  curl --silent -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/$namespace/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/$ctype  >> /home/asadmin/scripts/temp/neptunecollectionvalidation1.txt &&

for collectionname in "${collectionnames[@]}";
do

  neps=`cat /home/asadmin/scripts/temp/neptunecollectionvalidation1.txt | grep -A5 $collectionname | grep true |wc -l`
  if [ "$neps" = 0 ]
   then
   echo -e "${blue}$collectionname is not available in S-column Family.${NC} \n"
  # else
  # echo -e "${RED} $collectionname is not available in S-Column family ${NC} \n"
 fi

done
echo " "

echo -e "${YELLOW}List of collections not available in NovusDB Queue table: ${NC}"

  curl --silent -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/$namespace/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/collection/consumer/all  >> /home/asadmin/scripts/temp/neptunecollectionvalidation2.txt &&

for collectionname in "${collectionnames[@]}";
do

  nepsql=`cat /home/asadmin/scripts/temp/neptunecollectionvalidation2.txt | grep $collectionname |wc -l`
  if [ "$nepsql" = 0 ]
   then
   echo -e "${blue}$collectionname is not available in Novus DB${NC} \n"
  # else
  # echo -e "${RED} $collectionname is not available in Novus DB ${NC} \n"
 fi

done

rm /home/asadmin/scripts/temp/neptunecollectionvalidation1.txt
rm /home/asadmin/scripts/temp/neptunecollectionvalidation2.txt

}


main(){
echo -e "${BLUE}Available Clusters${NC}"
echo " "
echo -e " 1.Venus"
echo -e " 2.Mercury"
echo -e " 3.Neptune"
echo -e " 4.Easelvalidation"
echo -e " 5.exit"
echo " "
echo -e " ${yellow}Please select your option here ${NC}: \c" && read option
case $option in
   "1")
     echo " "
    # echo -e "${RED}Please pass the arguments for Venus Cluster:${NC} \c" && read -a ven
     echo " "
     venuscollectionvalidation
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
    # echo -e "${RED}Please pass the arguments for Mercury Cluster:${NC} \c" && read -a mer
      echo " "
      mercurycollectionvalidation
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
    # echo -e "${RED}Please pass the arguments for Neptune Cluster:${NC} \c" && read -a nep
     echo " "
     neptunecollectionvalidation

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
    # echo -e "${RED}Please pass the arguments for Neptune Cluster:${NC} \c" && read -a nep
     echo " "
     easelauxflagvalidation

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
