#!/bin/bash
#Author: Mahendra Gayam


echo " "
red="\033[00;31m"
RED="\033[01;31m"
green="\033[00;32m"
GREEN="\033[01;32m"
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
echo -e "${BLUE}Connecting to Hbase....${NC}"

cd /home/asadmin/keytabs
kdestroy 2> /dev/null
kinit -kt bigdata-app-ecpdemodockets-svc.keytab bigdata-app-ecpdemodockets-svc

echo " "

echo "list 'ecpdemodockets:NovusDoc'"|hbase shell >> /home/asadmin/scripts/temp/hbasehealth.txt
echo "list 'ecpdemodockets:NovusNims'"|hbase shell >> /home/asadmin/scripts/temp/hbasehealth.txt
echo "list 'ecpdemodockets:NovusNorm'"|hbase shell >> /home/asadmin/scripts/temp/hbasehealth.txt
kdestroy 2> /dev/null
kinit -kt bigdata-app-ecpdemolglnov-svc.keytab bigdata-app-ecpdemolglnov-svc

echo "list 'ecpdemolglnov:NovusDoc'"|hbase shell >> /home/asadmin/scripts/temp/hbasehealth2.txt
echo "list 'ecpdemolglnov:NovusNims'"|hbase shell >> /home/asadmin/scripts/temp/hbasehealth2.txt
echo "list 'ecpdemolglnov:NovusNorm'"|hbase shell >> /home/asadmin/scripts/temp/hbasehealth2.txt
clear
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo -e " ${RED}Host Name : c169rad.int.thomsonreuters.com${NC} "
echo -e "${BLUE}================================================${NC}"
echo " "
echo -e " ${YELLOW}Checking Authentication in Ecp_DemoDockets....${NC}"
echo " "
echo " "
cat /home/asadmin/scripts/temp/hbasehealth.txt | grep -v 'HBase' | grep -v 'Version' | grep -v 'Type' | grep -v 'TABLE' | head -20 > /home/asadmin/scripts/temp/availtest1.txt
a=`cat /home/asadmin/scripts/temp/availtest1.txt | grep 'row' |wc -l`
if [ "$a" -eq 3 ]
then
echo -e "${GREEN} Hbase connectivity is good ${NC}"
echo " "
cat /home/asadmin/scripts/temp/availtest1.txt
else
echo -e "${RED}Hbase connectivity is BAD${NC}"
fi
rm /home/asadmin/scripts/temp/availtest1.txt 2> /dev/null

rm /home/asadmin/scripts/temp/hbasehealth.txt 2> /dev/null

echo " "
echo -e " ${YELLOW}Checking Authentication in Ecp-Demo-LglNov...${NC}"
echo " "
echo " "
cat /home/asadmin/scripts/temp/hbasehealth2.txt | grep -v 'HBase' | grep -v 'Version' | grep -v 'Type' | grep -v 'TABLE' | head -20 > /home/asadmin/scripts/temp/availtest2.txt
b=`cat /home/asadmin/scripts/temp/availtest2.txt | grep 'row' |wc -l`
if [ "$b" -eq 3 ]
then
echo -e " ${GREEN} Hbase connectivity is good ${NC}"
echo " "
cat /home/asadmin/scripts/temp/availtest2.txt
else
echo -e "${RED} Hbase connectivity is BAD ${NC}"
fi
rm /home/asadmin/scripts/temp/availtest2.txt 2> /dev/null
rm /home/asadmin/scripts/temp/hbasehealth2.txt 2> /dev/null

echo " "
echo " "

