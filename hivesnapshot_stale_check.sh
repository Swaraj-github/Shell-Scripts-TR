#!/bin/sh

stale_check(){
#echo $1
	if [ "$1" -le 86400000 ]; then
#        if [ "$1" -le 180000 ]; then
#			echo "hivesnapshot job is not running more than 12 hours"
			exit 1
	else
#			echo "There is a concern"
			days=$(($application_up_time/86400000))
			days_mod=$(($application_up_time%86400000))
			hours=$(($days_mod/$((86400000/24))))
			hours_mod=$(($days_mod%$((86400000/24))))
			minutes=$(($hours_mod/$((86400000/$((24*60))))))
			minutes_mod=$(($hours_mod%$((86400000/$((24*60))))))
			application_details=`yarn application -list -appTypes YARN,SPARK | grep $line | gawk -F ' ' ' { print $1",",$2,$3,$4,$5,$6,$7 } '`
                        echo "Hivesnapshot job in Venus is running for" $days"days", $hours"hours", $minutes"minutes.  Yarn application Id, Job Name - " `yarn application -list -appTypes YARN,SPARK | grep $line | gawk -F ' ' ' { print $1",",$2,$3,$4,$5,$6,$7 } '`
                        (
echo "To:RAJENDRA.KUMARB@thomsonreuters.com,App-ECP-Bangalore@thomson.com"
echo "From: sebastianjoseph.kannothu@thomsonreuters.com"
echo "Subject: Hivesnapshot job is running more than 24 hours"
echo "Content-Type: text/html"
echo "Hivesnapshot job in Venus is running for" $days"days", $hours"hours", $minutes"minutes.  Yarn application Id, Job Name - " `yarn application -list -appTypes YARN,SPARK | grep $line | gawk -F ' ' ' { print $1",",$2,$3,$4,$5,$6,$7 } '`
)| /usr/sbin/sendmail -t
			exit 2
	fi
}


# main
yarn application -list -appStates RUNNING -appTypes YARN,SPARK | gawk -F ' ' ' { print $1,$2,$3,$4,$5,$6 } ' | grep "HBase to Hive Export table=ecpdemo" | grep 'ecpdemolglnov\|ecpdemodockets' |  gawk -F ' ' ' { print $1 } ' |  gawk -F ' ' ' { print $1 } ' | while read line; do  system_time=`date +%s%3N`; application_start_time=`yarn application -status $line | grep Start-Time | gawk -F ' ' ' { print $3 } ' `;application_up_time=$(($system_time-$application_start_time)); stale_check $application_up_time;  sleep 1; done





