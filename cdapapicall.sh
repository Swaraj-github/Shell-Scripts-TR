#! /bin/bash
#Author : Mahendra gayam
clear
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

echo -e "${WHITE}**             CDAP API script                                              **"

echo -e "${RED}******************************************************************************"

echo -e "${NC}"

echo " "
#echo -e "${yellow}Please enter the access token for venus:${NC} \c"
#read venuskey
#echo -e "${yellow}Please enter the access token for mercury:${NC} \c"
#read mercurykey
#echo -e "${yellow}Please enter the access token for neptune:${NC} \c"
#read neptunekey
#venus api calls

#echo -e "${yellow}Please enter the M account username:${NC} \c"
#read muser
#echo -e "${yellow}Please enter the M account password:${NC} \c"
#read -s mpwd

venuskey=`curl --silent -u s.CASK.CDAP.QED:N2aehwf3V73X5KFR http://demo-cdap-venus.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`
mercurykey=`curl --silent -u s.CASK.CDAP.PROD:KXP4wiFCywoe9999 http://prod-cdap-mercury.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`
neptunekey=`curl --silent -u s.CASK.CDAP.PROD:KXP4wiFCywoe9999 http://prod-cdap-neptune.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`

echo " "
echo -e "${YELLOW}Venus API calls:${NC}"
curl --silent -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/ecpdemodockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/getCountNovusDbQueue  >> /home/asadmin/scripts/temp/venusapioutput
echo " " >> /home/asadmin/scripts/temp/venusapioutput
#echo " " >> /home/asadmin/scripts/temp/venusapioutput
curl --silent -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/ecpdemodockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/seqId/consumer/current  >> /home/asadmin/scripts/temp/venusapioutput
#echo " "
echo " " >> /home/asadmin/scripts/temp/venusapioutput
curl --silent -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/ecpdemolglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/getCountNovusDbQueue  >> /home/asadmin/scripts/temp/venusapioutput
echo " " >> /home/asadmin/scripts/temp/venusapioutput
#echo " " >> /home/asadmin/scripts/temp/venusapioutput
curl --silent -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/ecpdemolglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/seqId/consumer/current  >> /home/asadmin/scripts/temp/venusapioutput
echo " "
cat /home/asadmin/scripts/temp/venusapioutput
echo " "

#Mercury api calls
#echo "Please enter the access token for mercury:"
echo " "
echo -e "${YELLOW}Mercury API calls:${NC}"
curl --silent -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/ecpdockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/getCountNovusDbQueue >> /home/asadmin/scripts/temp/mercuryapioutput
echo  " " >> /home/asadmin/scripts/temp/mercuryapioutput
#echo " " >> /home/asadmin/scripts/temp/mercuryapioutput

curl --silent -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/ecpdockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/seqId/consumer/current >> /home/asadmin/scripts/temp/mercuryapioutput
echo  " " >> /home/asadmin/scripts/temp/mercuryapioutput

curl --silent -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/ecplglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/getCountNovusDbQueue >> /home/asadmin/scripts/temp/mercuryapioutput
echo  " " >> /home/asadmin/scripts/temp/mercuryapioutput
#echo " " >> /home/asadmin/scripts/temp/mercuryapioutput

curl --silent -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/ecplglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/seqId/consumer/current >> /home/asadmin/scripts/temp/mercuryapioutput

echo " "
cat /home/asadmin/scripts/temp/mercuryapioutput
echo " "
#Neptune API calls
echo " "
echo -e "${YELLOW}Neptune API calls:${NC}"
curl --silent -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/ecpdockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/getCountNovusDbQueue >> /home/asadmin/scripts/temp/neptuneapioutput

echo " " >> /home/asadmin/scripts/temp/neptuneapioutput
#echo " " >> /home/asadmin/scripts/temp/neptuneapioutput
curl --silent -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/ecpdockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/seqId/consumer/current >> /home/asadmin/scripts/temp/neptuneapioutput
#echo " "
echo " " >> /home/asadmin/scripts/temp/neptuneapioutput

curl --silent -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/ecplglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/getCountNovusDbQueue >> /home/asadmin/scripts/temp/neptuneapioutput

echo " " >> /home/asadmin/scripts/temp/neptuneapioutput

curl --silent -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/ecplglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/novusDB/seqId/consumer/current >> /home/asadmin/scripts/temp/neptuneapioutput
echo " "
cat /home/asadmin/scripts/temp/neptuneapioutput
echo " "
echo " "

#Clearn up
rm /home/asadmin/scripts/temp/venusapioutput
rm /home/asadmin/scripts/temp/mercuryapioutput
rm /home/asadmin/scripts/temp/neptuneapioutput

