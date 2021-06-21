#Acorn Status Check
AcornAppStatus()
{
ssh -q c018mbuqeddoc.int.thomsonreuters.com "sh /home/asadmin/scripts/yarn_status.sh" > /home/asadmin/scripts/temp/Acorn_Venus
ssh -q c890xccniegmf.int.thomsonreuters.com "sh /home/asadmin/scripts/yarn_status.sh" > /home/asadmin/scripts/temp/Acorn_Mercury
ssh -q c777czfniegme.int.thomsonreuters.com "sh /home/asadmin/scripts/yarn_status.sh" > /home/asadmin/scripts/temp/Acorn_Neptune
}

#Calling each function
AcornAppStatus


Venus_TROA=`cat /home/asadmin/scripts/temp/Acorn_Venus | grep TROAFullPartition |wc -l`
Venus_TRKD=`cat /home/asadmin/scripts/temp/Acorn_Venus | grep OrganizationFinancial |wc -l`
Mercury_TROA=`cat /home/asadmin/scripts/temp/Acorn_Mercury | grep TROAFullPartition |wc -l`
Mercury_TRKD=`cat /home/asadmin/scripts/temp/Acorn_Mercury | grep OrganizationFinancial |wc -l`
Neptune_TROA=`cat /home/asadmin/scripts/temp/Acorn_Neptune | grep TROAFullPartition |wc -l`
Neptune_TRKD=`cat /home/asadmin/scripts/temp/Acorn_Neptune | grep OrganizationFinancial |wc -l`


if  [[ $Venus_TROA -eq 0 || $Venus_TROA -gt 1 || $Venus_TRKD -eq 0 || $Venus_TRKD -gt 1 || $Mercury_TROA -eq 0 || $Mercury_TROA -gt 1 || $Mercury_TRKD -eq 0 || $Mercury_TRKD -gt 1 || $Neptune_TROA -eq 0 || $Neptune_TROA -gt 1 || $Neptune_TRKD -eq 0 || $Neptune_TRKD -gt 1 ]]
then

(
echo "To:  App-ECP-Bangalore@thomson.com"
echo "To: sumit.khajanchi@thomsonreuters.com"
echo "From: sumit.khajanchi@thomsonreuters.com"
echo "Subject: Acorn YARN Application Status"
echo "Content-Type: text/html"

echo '<html><head><title>YARN Dashboard Acorn App Status</title></head><body><table border=4 style="width:100%"><tr><td bgcolor="#87CEEB" style="width:100%" colspan="2"><center><b>YARN Dashboard - Acorn App Status </b></center></td></tr><tr bgcolor="#87CEEB"><td>Application</td><td>Yarn-Status </td></tr>'

echo "<tr><td>Venus TROA</td><td "
if [ $Venus_TROA -eq 1 ]
        then
                echo 'bgcolor="#00ff00">Running</td></tr>'
        elif [ $Venus_TROA -eq 0 ]
        then
                echo "bgcolor="#ff0000">Not Running</td></tr>"
        elif [ $Venus_TROA -gt 1 ]
        then
                echo "bgcolor="##00ff00">Duplicate instances found, Killing one.</td></tr>"
fi
echo "<tr><td>Venus TRKD</td><td "
if [ $Venus_TRKD -eq 1 ]
        then
                echo 'bgcolor="#00ff00">Running</td></tr>'
        elif [ $Venus_TRKD -eq 0 ]
        then
                echo "bgcolor="#ff0000">Not Running</td></tr>"
        elif [ $Venus_TRKD -gt 1 ]
        then
                echo "bgcolor="#00ff00">Duplicate instances found, Killing one.</td></tr>"
fi
echo "<tr><td>Mercury TROA</td><td "
if [ $Mercury_TROA -eq 1 ]
        then
                echo 'bgcolor="#00ff00">Running</td></tr>'
        elif [ $Mercury_TROA -eq 0 ]
        then
                echo "bgcolor="#ff0000">Not Running</td></tr>"
        elif [ $Mercury_TROA -gt 1 ]
        then
                echo "bgcolor="##00ff00">Duplicate instances found, Killing one.</td></tr>"
fi
echo "<tr><td>Mercury TRKD</td><td "
if [ $Mercury_TRKD -eq 1 ]
        then
                echo 'bgcolor="#00ff00">Running</td></tr>'
        elif [ $Mercury_TRKD -eq 0 ]
        then
                echo "bgcolor="#ff0000">Not Running</td></tr>"
        elif [ $Mercury_TRKD -gt 1 ]
        then
                echo "bgcolor="#00ff00">Duplicate instances found, Killing one.</td></tr>"
fi
echo "<tr><td>Neptune TROA</td><td "
if [ $Neptune_TROA -eq 1 ]
        then
                echo 'bgcolor="#00ff00">Running</td></tr>'
        elif [ $Neptune_TROA -eq 0 ]
        then
                echo "bgcolor="#ff0000">Not Running</td></tr>"
        elif [ $Neptune_TROA -gt 1 ]
        then
                echo "bgcolor="##00ff00">Duplicate instances found, Killing one.</td></tr>"
fi
echo "<tr><td>Neptune TRKD</td><td "
if [ $Neptune_TRKD -eq 1 ]
        then
                echo 'bgcolor="#00ff00">Running</td></tr>'
        elif [ $Neptune_TRKD -eq 0 ]
        then
                echo "bgcolor="#ff0000">Not Running</td></tr>"
        elif [ $Neptune_TRKD -gt 1 ]
        then
                echo "bgcolor="#00ff00">Duplicate instances found, Killing one.</td></tr>"
fi

echo "</table>"

if [[ $Venus_TRKD -gt 1  || $Venus_TROA -gt 1 ]]
then
ssh -q c018mbuqeddoc.int.thomsonreuters.com "sh /home/asadmin/scripts/Duplicate_instance.sh"
fi

if [[ $Mercury_TRKD -gt 1  || $Mercury_TROA -gt 1 ]]
then
ssh -q c890xccniegmf.int.thomsonreuters.com "sh /home/asadmin/scripts/Duplicate_instance.sh"
fi

if [[ $Neptune_TRKD -gt 1  || $Neptune_TROA -gt 1 ]]
then
ssh -q c777czfniegme.int.thomsonreuters.com "sh /home/asadmin/scripts/Duplicate_instance.sh"
fi

#echo "</table></body></html>"
)| /usr/sbin/sendmail -t

fi
