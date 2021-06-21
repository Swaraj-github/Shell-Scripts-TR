#! /bin/bash
#Author : Swaraj Sampad Mallick
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

echo -e "${WHITE}**             CDAP API script                                             **"

echo -e "${RED}******************************************************************************"

echo -e "${NC}"

echo " "

#echo -e "${yellow}Please enter the M account username:${NC} \c"
#read muser
#echo -e "${yellow}Please enter the M account password:${NC} \c"
#read mpwd


venuskey=`curl --silent -u s.CASK.CDAP.QED:N2aehwf3V73X5KFR http://demo-cdap-venus.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`
mercurykey=`curl --silent -u s.CASK.CDAP.PROD:KXP4wiFCywoe9999 http://prod-cdap-mercury.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`
neptunekey=`curl --silent -u s.CASK.CDAP.PROD:KXP4wiFCywoe9999 http://prod-cdap-neptune.int.thomsonreuters.com:10009/token | awk -F '"' '{ print $4 }'`


echo " "
echo -e "${CYAN}CDAP to HBase connectivity check for Venus ecpdemodockets->${NC} \c"
x=`curl -s -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/ecpdemodockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/DOC | grep -o collectionName | wc -l`
if [ "$x" -gt 0 ]
then
echo -e "${blue}CDAP to HBase connectivity is fine for Venus:ecpdemodockets${NC} \c"
else
echo -e "${RED}CDAP to HBase connectivity is Down for Venus:ecpdemodockets${NC} \c"
fi


echo " "
echo -e "${CYAN}CDAP to HBase connectivity check for Venus ecpdemolglnov->${NC} \c"
y=`curl -s -H "Authorization:Basic $venuskey" http://demo-cdap-venus.int.thomsonreuters.com:10000/v3/namespaces/ecpdemolglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/DOC | grep -o collectionName | wc -l`
if [ "$y" -gt 0 ]
then
echo -e "${blue}CDAP to HBase connectivity is fine for Venus:ecpdemolglnov.${NC} \c"
else
echo -e "${RED}CDAP to HBase connectivity is Down for Venus:ecpdemolglnov${NC} \c"
fi


echo " "
echo -e "${CYAN}CDAP to HBase connectivity check for Neptune ecpdockets->${NC} \c"
x=`curl -s -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/ecpdockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/DOC | grep -o collectionName | wc -l`
if [ "$x" -gt 0 ]
then
echo -e "${blue}CDAP to HBase connectivity is fine for Neptune:ecpdockets.${NC} \c"
else
echo -e "${RED}CDAP to HBase connectivity is Down for Neptune:ecpdockets${NC} \c"
fi

echo " "
echo -e "${CYAN}CDAP to HBase connectivity check for Neptune ecplglnov->${NC} \c"
y=`curl -s -H "Authorization:Basic $neptunekey" http://prod-cdap-neptune.int.thomsonreuters.com:10000/v3/namespaces/ecplglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/DOC | grep -o collectionName | wc -l`
if [ "$y" -gt 0 ]
then
echo -e "${blue}CDAP to HBase connectivity is fine for Neptune:ecplglnov.${NC} \c"
else
echo -e "${RED}CDAP to HBase connectivity is Down for Neptune:ecplglnov${NC} \c"
fi

echo " "
echo -e "${CYAN}CDAP to HBase connectivity check for Mercury ecpdockets->${NC} \c"
x=`curl -s -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/ecpdockets/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/DOC | grep -o collectionName | wc -l`
if [ "$x" -gt 0 ]
then
echo -e "${blue}CDAP to HBase connectivity is fine for Mercury:ecpdockets.${NC} \c"
else
echo -e "${RED}CDAP to HBase connectivity is Down for Mercury:ecpdockets${NC} \c"
fi

echo " "
echo -e "${CYAN}CDAP to HBase connectivity check for Mercury ecplglnov->${NC} \c"
y=`curl -s -H "Authorization:Basic $mercurykey" http://prod-cdap-mercury.int.thomsonreuters.com:10000/v3/namespaces/ecplglnov/apps/EcpNovusIncremental/services/DataServiceV2/methods/scf/DOC | grep -o collectionName | wc -l`
if [ "$y" -gt 0 ]
then
echo -e "${blue}CDAP to HBase connectivity is fine for Mercury:ecplglnov.${NC} \c"
else
echo -e "${RED}CDAP to HBase connectivity is Down for Mercury:ecplglnov${NC} \c"
fi
echo " "

