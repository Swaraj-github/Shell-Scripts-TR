ssh -q c018mbuqeddoc.int.thomsonreuters.com " sh /home/asadmin/scripts/app_status.sh " > acorn
ssh -q c777czfniegme.int.thomsonreuters.com " sh /home/asadmin/scripts/app_status.sh " >> acorn
ssh -q c890xccniegmf.int.thomsonreuters.com " sh /home/asadmin/scripts/app_status.sh " >> acorn

(
echo "To: sumit.khajanchi@thomsonreuters.com"
echo "From: sumit.khajanchi@thomsonreuters.com"
echo "Subject: ACORN Application Check"
echo "Content-Type: text/html"

echo '<html><head><title>Acorn Application status Check</title></head><body>'
echo '<table border=4 style="width:100%"><tr><td bgcolor="#87CEEB" style="width:100%" colspan="3"><center><b>Acorn Application Status</b></center></td></tr>'
echo '<tr bgcolor="#87CEEB"> <td>Environment</td> <td>TRKD </td> <td>TROA</td> </tr>'
cat acorn
echo '</table></body></html>'

)| /usr/sbin/sendmail -t

