#! /usr/bin/bash
#Author: Mahendra Gayam

  topic1()
  {
      cd /home/asadmin/kafka_2.10-0.9.0.0/bin/
   ./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.mdg.input.new | awk '{print $6}' | grep "\-1" > /home/asadmin/scripts/temp/leader1.txt
  if [ -s /home/asadmin/scripts/temp/leader1.txt ]
  then
 
  echo "./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.mdg.input.new" > /home/asadmin/scripts/temp/leadermail.txt
  ./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.mdg.input.new | grep "\-1" >> /home/asadmin/scripts/temp/leadermail.txt
  mail -s "[SDP]-Kafka topic health is BAD" west.ams-novus@thomsonreuters.com < /home/asadmin/scripts/temp/leadermail.txt

  
  rm /home/asadmin/scripts/temp/leader1.txt
  rm /home/asadmin/scripts/temp/leadermail.txt
  fi
  }

topic2()
{
    cd /home/asadmin/kafka_2.10-0.9.0.0/bin/
 ./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.data.new | awk '{print $6}' | grep "\-1" > /home/asadmin/scripts/temp/leader1.txt
 if [ -s /home/asadmin/scripts/temp/leader1.txt ]
 then

 echo "./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.data.new" > /home/asadmin/scripts/temp/leadermail.txt
 ./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:2181 --topic ecpv1sdp.data.new | grep "\-1" >> /home/asadmin/scripts/temp/leadermail.txt
 mail -s "[SDP]-Kafka topic health is BAD" west.ams-novus@thomsonreuters.com < /home/asadmin/scripts/temp/leadermail.txt
 
 rm /home/asadmin/scripts/temp/leader1.txt
 rm /home/asadmin/scripts/temp/leadermail.txt
 fi
 }

 topic3()
  {
      cd /home/asadmin/kafka_2.10-0.9.0.0/bin/
   ./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecpqedv1sdp.mdg.input.new | awk '{print $6}' | grep "\-1" > /home/asadmin/scripts/temp/leader1.txt
  if [ -s /home/asadmin/scripts/temp/leader1.txt ]
  then
 
  echo "./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecpqedv1sdp.mdg.input.new" > /home/asadmin/scripts/temp/leadermail.txt
  ./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecpqedv1sdp.mdg.input.new | grep "\-1" >> /home/asadmin/scripts/temp/leadermail.txt
  mail -s "[SDP]-Kafka topic health is BAD" west.ams-novus@thomsonreuters.com < /home/asadmin/scripts/temp/leadermail.txt

  rm /home/asadmin/scripts/temp/leader1.txt
  rm /home/asadmin/scripts/temp/leadermail.txt
  fi
  }

topic4()
{
    cd /home/asadmin/kafka_2.10-0.9.0.0/bin/
 ./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecpqedv1sdp.data.new | awk '{print $6}' | grep "\-1" > /home/asadmin/scripts/temp/leader1.txt
 if [ -s /home/asadmin/scripts/temp/leader1.txt ]
 then

 echo "./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecpqedv1sdp.data.new" > /home/asadmin/scripts/temp/leadermail.txt
 ./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecpqedv1sdp.data.new | grep "\-1" >> /home/asadmin/scripts/temp/leadermail.txt
 mail -s "[SDP]-Kafka topic health is BAD" west.ams-novus@thomsonreuters.com < /home/asadmin/scripts/temp/leadermail.txt

 rm /home/asadmin/scripts/temp/leader1.txt
 rm /home/asadmin/scripts/temp/leadermail.txt
 fi
 }

topic5()
  {
      cd /home/asadmin/kafka_2.10-0.9.0.0/bin/
   ./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecp.statebenefits.data | awk '{print $6}' | grep "\-1" > /home/asadmin/scripts/temp/leader1.txt
  if [ -s /home/asadmin/scripts/temp/leader1.txt ]
  then
  echo "./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecp.statebenefits.data" > /home/asadmin/scripts/temp/leadermail.txt
  ./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecp.statebenefits.data | grep "\-1" >> /home/asadmin/scripts/temp/leadermail.txt
  mail -s "[SDP]-Kafka topic health is BAD" west.ams-novus@thomsonreuters.com < /home/asadmin/scripts/temp/leadermail.txt

  rm /home/asadmin/scripts/temp/leader1.txt
  rm /home/asadmin/scripts/temp/leadermail.txt
  fi
  }

topic6()
{
    cd /home/asadmin/kafka_2.10-0.9.0.0/bin/
 ./kafka-topics.sh --describe --zookeeper kafka-cisdeveagf.int.thomsonreuters.com:2181 --topic ecp.statebenefits.control | awk '{print $6}' | grep "\-1" > /home/asadmin/scripts/temp/leader1.txt
 if [ -s /home/asadmin/scripts/temp/leader1.txt ]
 then
 echo "./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:9092 --topic ecp.statebenefits.control" > /home/asadmin/scripts/temp/leadermail.txt
 ./kafka-topics.sh --describe --zookeeper kafka-cisprodeage.int.thomsonreuters.com:9092 --topic ecp.statebenefits.control | grep "\-1" >> /home/asadmin/scripts/temp/leadermail.txt
 mail -s "[SDP]-Kafka topic health is BAD" west.ams-novus@thomsonreuters.com < /home/asadmin/scripts/temp/leadermail.txt
 
 rm /home/asadmin/scripts/temp/leader1.txt
 rm /home/asadmin/scripts/temp/leadermail.txt
 fi
 }

topic1
topic2
topic3
topic4
topic5


