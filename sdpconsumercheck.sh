#! /usr/bin/bash
#Author: Mahendra Gayam

cd /home/asadmin/kafka_2.10-0.9.0.0/bin/
 ./kafka-consumer-offset-checker.sh --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.mdg.input.new --group sdp-1pct-consumer-prod-new-may16 | awk '{print $6}' | grep "unknown" > /home/asadmin/scripts/temp/consumerlag1.txt
 
 if [ -s /home/asadmin/scripts/temp/consumerlag1.txt ]
 then
 echo "./kafka-consumer-offset-checker.sh --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.mdg.input.new --group sdp-1pct-consumer-prod-new-may16" > /home/asadmin/scripts/temp/consumerlagmail.txt
 ./kafka-consumer-offset-checker.sh --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.mdg.input.new --group sdp-1pct-consumer-prod-new-may16 >> /home/asadmin/scripts/temp/consumerlagmail.txt
 mail -s "[SDP]-Kafka Consumer health is BAD" west.ams-novus@thomsonreuters.com < /home/asadmin/scripts/temp/consumerlagmail.txt

#else
#echo "Consumer health is good"
#./kafka-consumer-offset-checker.sh --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.mdg.input.new --group sdp-1pct-consumer-prod-new

 rm /home/asadmin/scripts/temp/consumerlag1.txt
 rm /home/asadmin/scripts/temp/consumerlagmail.txt
 fi
