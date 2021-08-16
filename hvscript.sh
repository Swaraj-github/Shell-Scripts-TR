#! /bin/bash
#Swaraj Sampad Mallick

dt=`date -d yesterday '+%Y%m%d'`
echo "The status of Hive Snapshot is for $dt"

cd /home/asadmin/hivesnapshot/logs

if [ -f "ecplglnov.NovusDoc.$dt"1600".log.backup.err" ]
then
echo "The ecplglnov.NovusDoc job failed to trigger for $dt"1600" timestamp"
else
echo "The ecplglnov.NovusDoc job has triggered for $dt"1600" timestamp"
fi


if [ -f "ecplglnov.NovusNorm.$dt"2100".log.backup.err" ]
then
echo "The ecplglnov.NovusNorm job failed to trigger for $dt"2100" timestamp"
else
echo "The ecplglnov.NovusNorm job has triggered for $dt"2100" timestamp"
fi

scountNorm=`grep 'SUCCESS COUNT' ecplglnov.NovusNorm.$dt"2100".log | tail -1 | awk -F ': ' '{print $2}'`
if ! [[ "$scountNorm" =~ ^[0-9]+$ ]]
then
ccountNorm=`grep 'Export collection END' ecplglnov.NovusNorm.$dt"2100".log | wc -l`
echo "The Hive Snapshot job is under progress for ecplglnov.NovusNorm and the count of completed collections is : $ccountNorm (In Progress)"
else
echo "Total number of collections got Successfully Hive Snapsorted in ecplglnov:NORM on $dt"2100" is : $scountNorm"
fi
fcountNorm=`grep 'FAILED COUNT' ecplglnov.NovusNorm.$dt"2100".log | tail -1 | awk -F ': ' '{print $2}'`
echo "Total number of collections Failed to get Hive Snapsorted in ecplglnov:NORM on $dt"2100" is : $fcountNorm"

scountDoc=`grep 'SUCCESS COUNT' ecplglnov.NovusDoc.$dt"1600".log | tail -1 | awk -F ': ' '{print $2}'`
if ! [[ "$scountDoc" =~ ^[0-9]+$ ]]
then
ccountDoc=`grep 'Export collection END' ecplglnov.NovusDoc.$dt"1600".log | wc -l`
echo "The Hive Snapshot job is under progress for ecplglnov.NovusDoc and the count of completed collections is : $ccountDoc(In Progress)"
else
echo "Total number of collections got Successfully Hive Snapsorted in ecplglnov:DOC on $dt"1600" is : $scountDoc"
fi
fcountDoc=`grep 'FAILED COUNT' ecplglnov.NovusDoc.$dt"1600".log | tail -1 | awk -F ': ' '{print $2}'`
echo "Total number of collections Failed to get Hive Snapsorted in ecplglnov:DOC on $dt"1600" is : $fcountDoc"

#NOVUS:NORM (Re-export Condition)
if [ "$fcountNorm" -gt 0 ]
then
rcountNorm=`grep 'SUCCESS COUNT' ecplglnov.NovusNorm.$dt"2100".log.reexport | tail -1 | awk -F ': ' '{print $2}'`
rfcountNorm=`grep 'FAILED COUNT' ecplglnov.NovusNorm.$dt"2100".log.reexport | tail -1 | awk -F ': ' '{print $2}'`
echo "The number of ecplglnov.NovusNorm collections got re-exported successfully : $rcountNorm"
echo "The number of ecplglnov.NovusNorm collections failed to get re-export successfully : $rfcountNorm"

else

echo "The number of ecplglnov.NovusNorm collections got re-exported successfully : 0"
echo "The number of ecplglnov.NovusNorm collections failed to get re-export successfully : 0"
fi

#NOVUS:DOC (Re-export Condition)
if [ "$fcountDoc" -gt 0 ]
then
rcountDoc=`grep 'SUCCESS COUNT' ecplglnov.NovusDoc.$dt'1600'.log.reexport | tail -1 | awk -F ': ' '{print $2}'`
rfcountDoc=`grep 'FAILED COUNT' ecplglnov.NovusDoc.$dt'1600'.log.reexport | tail -1 | awk -F ': ' '{print $2}'`
echo "The number of ecplglnov.NovusDoc collections got re-exported successfully : $rcountDoc"
echo "The number of ecplglnov.NovusDoc collections failed to get re-export successfully : $rfcountDoc"

else

echo "The number of ecplglnov.NovusDoc collections got re-exported successfully : 0"
echo "The number of ecplglnov.NovusDoc collections failed to get re-export successfully : 0"
fi
