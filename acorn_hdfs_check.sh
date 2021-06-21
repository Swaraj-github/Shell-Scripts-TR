

ssh -q c018mbuqeddoc.int.thomsonreuters.com " sh /home/asadmin/scripts/hdfs_check.sh " > acorn
ssh -q c777czfniegme.int.thomsonreuters.com " sh /home/asadmin/scripts/hdfs_check.sh " >> acorn
ssh -q c890xccniegmf.int.thomsonreuters.com " sh /home/asadmin/scripts/hdfs_check.sh " >> acorn

ssh -q c018mbuqeddoc.int.thomsonreuters.com " sh /home/asadmin/scripts/hdfs_check_Inc_creation.sh " >Inc_creation.log 
ssh -q c777czfniegme.int.thomsonreuters.com " sh /home/asadmin/scripts/hdfs_check_Inc_creation.sh " >> Inc_creation.log
ssh -q c890xccniegmf.int.thomsonreuters.com " sh /home/asadmin/scripts/hdfs_check_Inc_creation.sh " >> Inc_creation.log

grep "TRKD" Inc_creation.log | grep "Venus"  > /log/Acorn_Content_Replicator/acorn_hdfs_file_check_TRKD_Venus.log
grep "TRKD" Inc_creation.log | grep "Mercury" > /log/Acorn_Content_Replicator/acorn_hdfs_file_check_TRKD_Mercury.log
grep "TRKD" Inc_creation.log | grep "Neptune" > /log/Acorn_Content_Replicator/acorn_hdfs_file_check_TRKD_Neptune.log

grep "TROA" Inc_creation.log | grep "Venus" > /log/Acorn_Content_Replicator/acorn_hdfs_file_check_TROA_Venus.log
grep "TROA" Inc_creation.log | grep "Mercury" > /log/Acorn_Content_Replicator/acorn_hdfs_file_check_TROA_Mercury.log
grep "TROA" Inc_creation.log | grep "Neptune" > /log/Acorn_Content_Replicator/acorn_hdfs_file_check_TROA_Neptune.log

(
echo "To: sumit.khajanchi@thomsonreuters.com"
#echo "To: App-EnterprisePlatforms-ECP@thomsonreuters.com"
echo "From:  App-EnterprisePlatforms-ECP@thomsonreuters.com"
echo "Subject: ACORN HDFS CHECK"
echo "Content-Type: text/html"

echo '<html><head><title>Acorn HDFS Check</title></head><body>'
echo '<table border=4 style="width:100%"><tr><td bgcolor="#87CEEB" style="width:100%" colspan="7"><center><b>Acorn HDFS Status</b></center></td></tr>'
echo '<tr bgcolor="#87CEEB"> <td>Environment</td><td>TROAFullPartition - Last Updated</td><td>TROAFullFlat - Last Updated</td><td>TROABestValue - Last Updated</td><td>TROAFullBestValue - Last Updated</td><td>TRKDDifferential - Last Updated </td><td>TRKD Full - Last Updated </td> </tr>'
#echo '<table border=4 style="width:100%"><tr><td bgcolor="#87CEEB" style="width:100%" colspan="3"><center><b>Acorn HDFS Status</b></center></td></tr>'
#echo '<tr bgcolor="#87CEEB"> <td>Environment</td><td>TRKDDifferential - Last Updated </td><td>TRKD Full - Last Updated </td> </tr>'
cat acorn
echo '</table></body></html>'

)| /usr/sbin/sendmail -t

rm acorn Inc_creation.log
