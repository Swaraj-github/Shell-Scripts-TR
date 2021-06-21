#!/bin/bash

Count_verification_application_check_fn () {
	application_count=`yarn application -list -appStates RUNNING -appTypes YARN,SPARK | gawk -F ' ' ' { print $1,$2 } ' | grep -i ECPNovusIngestVerification.CountVerificationWF | wc -l`
	# if application count is zero, exit the script
	if [[ "$application_count" -lt 1 ]]; then
#			echo "'Count verification job' not running, hence exiting the script"
                        exit 0
	fi

        for i in `yarn application -list -appStates RUNNING -appTypes YARN,SPARK | gawk -F ' ' ' { print $1,$2 } ' | grep -i ECPNovusIngestVerification.CountVerificationWF | gawk -F ' ' ' { print $1 } '`; do
	    start_time=`yarn application -status $i | grep Start-Time`
            application_start_time=`echo $start_time | gawk -F ' ' ' { print $3 } ' `
	    system_time=`date +%s%3N`
	    application_up_time=$(($system_time-$application_start_time))

	# if the application running time  is greater than 4 hours(14400000ms)

            if [ "$application_up_time" -le 14400000 ]; then
#			echo "count verification job is not running more than 4 hours"
                        exit 1
	    else
#			echo "There is a concern"
			days=$(($application_up_time/86400000))
			days_mod=$(($application_up_time%86400000))
			hours=$(($days_mod/$((86400000/24))))
			hours_mod=$(($days_mod%$((86400000/24))))
			minutes=$(($hours_mod/$((86400000/$((24*60))))))
			minutes_mod=$(($hours_mod%$((86400000/$((24*60))))))
                        application_name=`yarn application -status $i | grep Application-Name | gawk -F ' ' ' { print $2,$3 } ' | gawk -F ' ' ' { print $2 } '`
#			echo "$application_name job in Venus  is running for" $days"days", $hours"hours", $minutes"minutes" | mail -s "Count verification job - stale check" sebastianjoseph.kannothu@thomsonreuters.com RAJENDRA.KUMARB@thomsonreuters.com
(
echo "To:RAJENDRA.KUMARB@thomsonreuters.com,ecp-pcm-blr-support@thomsonreuters.com,App-ECP-Bangalore@thomson.com"
echo "From:sebastianjoseph.kannothu@thomsonreuters.com"
echo "Subject: count verification check - "$cluster
echo "Content-Type: text/html"
echo $application_name " job in " $cluster " is running for" $days"days", $hours"hours", $minutes"minutes. If this job is stuck please restart it from cdap"
)| /usr/sbin/sendmail -t

            fi
        done
}
cluster=$1
Count_verification_application_check_fn

