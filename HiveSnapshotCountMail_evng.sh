#!/usr/bin/bash
#Swaraj Sampad Mallick

ssh -q c566pabesbes1.int.thomsonreuters.com " sh /home/asadmin/hvscript_evng.sh " > Venus
ssh -q c561eyrsnien1.int.thomsonreuters.com " sh /home/asadmin/hvscript_evng.sh " > Venus1
ssh -q c455nmmniegmf.int.thomsonreuters.com " sh /home/asadmin/hvscript_evng.sh " > Mercury
ssh -q c769uxbniegmf.int.thomsonreuters.com " sh /home/asadmin/hvscript_evng.sh " > Mercury1
ssh -q c864tgknepe01.int.thomsonreuters.com " sh /home/asadmin/hvscript_evng.sh " > Neptune
ssh -q c703adhsnienp.int.thomsonreuters.com " sh /home/asadmin/hvscript_evng.sh " > Neptune1

(
echo "To: swarajsampad.mallick@thomsonreuters.com, RAJENDRA.KUMARB@thomsonreuters.com, App-ECP-Bangalore@thomson.com, west.ams-novus@thomsonreuters.com"
echo "From: swarajsampad.mallick@thomsonreuters.com"
echo "Subject: Hive Snapshot status mail"
echo "Content-Type: text/html"

echo '<html>
<body>
<table border=4 style="width:100%">

<tr>
<td bgcolor="#87CEEB" colspan="6">
<center><b>Collection Count In Each Cluster</b></center>
</td>
</tr>

<tr> 
<td bgcolor="#87CEEB" colspan="2">
<center>  Venus <b><i>ecpdemolglnov</i></b> Collection Count </center>  </td>
<td bgcolor="#87CEEB" colspan="2">
<center>  Mercury <b><i>ecplglnov</b></i> Collection Count </center>  </td>
<td bgcolor="#87CEEB" colspan="2">
<center>  Neptune <b><i>ecplglnov</b></i> Collection Count </center>  </td>
</tr>

<tr>
<th> <center> Novus DOC </center>  </th>
<th> <center> 1263 </center> </th>
<th> <center> Novus DOC </center>  </th>
<th> <center> 1267 </center> </th>
<th> <center> Novus DOC </center>  </th>
<th> <center> 1267 </center> </th>
</tr>

<tr>
<th> <center> Novus NIMS </center>  </th>
<th> <center> 348 </center> </th>
<th> <center> Novus NIMS </center>  </th>
<th> <center> 349 </center> </th>
<th> <center> Novus NIMS </center>  </th>
<th> <center> 349 </center> </th>
</tr>

<tr>
<th> <center> Novus NORM </center>  </th>
<th> <center> 73 </center> </th>
<th> <center> Novus NORM </center>  </th>
<th> <center> 73 </center> </th>
<th> <center> Novus NORM </center>  </th>
<th> <center> 73 </center> </th>
</tr>

<tr> 
<td bgcolor="#87CEEB" colspan="2">
<center>  Venus <b><i>ecpdemodockets</i></b> Collection Count </center>  </td>
<td bgcolor="#87CEEB" colspan="2">
<center>  Mercury <b><i>ecpdockets</i></b> Collection Count </center>  </td>
<td bgcolor="#87CEEB" colspan="2">
<center>  Neptune <b><i>ecpdockets</i></b> Collection Count </center>  </td>
</tr>

<tr>
<th> <center> Novus DOC </center>  </th>
<th> <center> 105 </center> </th>
<th> <center> Novus DOC </center>  </th>
<th> <center> 105 </center> </th>
<th> <center> Novus DOC </center>  </th>
<th> <center> 105 </center> </th>
</tr>
</html></body>'

echo "&nbsp"
echo "&nbsp"
echo '<html>'
echo '<body>'
Venus17=$(grep 'The ecpdemolglnov.NovusDoc job failed to triggered for' Venus | awk '{print}')
Venus18=$(grep 'The ecpdemolglnov.NovusNorm job failed to triggered for' Venus | awk '{print}')
Venus19=$(grep 'The ecpdemodockets.NovusDoc job failed to triggered for' Venus1 | awk '{print}')
Venus20=$(grep 'The ecpdemolglnov.NovusNims job failed to triggered for' Venus1 | awk '{print}')

echo "<p><i><b>$Venus17</b></i><p>"
echo "<p><i><b>$Venus18</b></i><p>"
echo "<p><i><b>$Venus19</b></i><p>"
echo "<p><i><b>$Venus20</b></i><p>"

Mercury17=$(grep 'The ecplglnov.NovusDoc job failed to triggered for' Mercury | awk '{print}')
Mercury18=$(grep 'The ecplglnov.NovusNorm job failed to triggered for' Mercury | awk '{print}')
Mercury19=$(grep 'The ecpdockets.NovusDoc job failed to triggered for' Mercury1 | awk '{print}')
Mercury20=$(grep 'The ecplglnov.NovusNims job failed to triggered for' Mercury1 | awk '{print}')

echo "<p><i><b>$Mercury17</b></i><p>"
echo "<p><i><b>$Mercury18</b></i><p>"
echo "<p><i><b>$Mercury19</b></i><p>"
echo "<p><i><b>$Mercury20</b></i><p>"

Neptune17=$(grep 'The ecplglnov.NovusDoc job failed to triggered for' Neptune | awk '{print}')
Neptune18=$(grep 'The ecplglnov.NovusNorm job failed to triggered for' Neptune | awk '{print}')
Neptune19=$(grep 'The ecpdockets.NovusDoc job failed to triggered for' Neptune1 | awk '{print}')
Neptune20=$(grep 'The ecplglnov.NovusNims job failed to triggered for' Neptune1 | awk '{print}')

echo "<p><i><b>$Neptune17</b></i><p>"
echo "<p><i><b>$Neptune18</b></i><p>"
echo "<p><i><b>$Neptune19</b></i><p>"
echo "<p><i><b>$Neptune20</b></i><p>"


echo '</body></html>'

echo "&nbsp"
echo "&nbsp"
echo "&nbsp"
echo '<html>
<head>
<title>Hive Snapshot Status</title>
</head>
<body>
<table border=4 style="width:100%">
<tr>
<td bgcolor="#87CEEB" colspan="17">
<center><b>Hive Snapshot Status</b></center>
</td>
</tr>
<tr bgcolor="#87CEEB">
<th  <center>  Environment </center>  </th>
<th  colspan="4"> <center>  dockets:NovusDoc </center>  </th>
<th  colspan="4"> <center>  lglnov:NovusDoc </center>   </th>
<th  colspan="4"> <center>  lglnov:NovusNims </center>  </th>
<th  colspan="4"> <center>  lglnov:NovusNorm </center>  </th>
</tr>

<tr bgcolor="#87CEEB">
<th> <center>  Status </center>  </th>

<th> <center>  Success Count </center>  </th>
<th> <center>  Failure Count </center>  </th>
<th> <center>  Re-export Success Count </center>  </th>
<th> <center>  Re-export Failure Count </center>  </th>

<th> <center>  Success Count </center>  </th>
<th> <center>  Failure Count </center>  </th>
<th> <center>  Re-export Success Count </center>  </th>
<th> <center>  Re-export Failure Count </center>  </th>

<th> <center>  Success Count </center>  </th>
<th> <center>  Failure Count </center>  </th>
<th> <center>  Re-export Success Count </center>  </th>
<th> <center>  Re-export Failure Count </center>  </th>

<th> <center>  Success Count </center>  </th>
<th> <center>  Failure Count </center>  </th>
<th> <center>  Re-export Success Count </center>  </th>
<th> <center>  Re-export Failure Count </center>  </th>

</tr>

<tr bgcolor="#FFFFFF"> 
<td  <center>  Venus </center>  </td>'

#for i in ecpdemolglnov:NovusNorm;
#do
Venus1=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecpdemolglnov:NORM|The Hive Snapshot job is under progress for ecpdemolglnov.NovusNorm and the count of completed collections is" Venus | awk -F ' : ' '{print $2}')
Venus2=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecpdemolglnov:NORM' Venus | awk -F ' : ' '{print $2}')
Venus3=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecpdemolglnov:DOC|The Hive Snapshot job is under progress for ecpdemolglnov.NovusDoc and the count of completed collections is" Venus | awk -F ' : ' '{print $2}')
Venus4=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecpdemolglnov:DOC' Venus | awk -F ' : ' '{print $2}')
Venus5=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecpdemolglnov:NIMS|The Hive Snapshot job is under progress for ecpdemolglnov.NovusNims and the count of completed collections is" Venus1 | awk -F ' : ' '{print $2}')
Venus6=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecpdemolglnov:NIMS' Venus1 | awk -F ' : ' '{print $2}')
Venus7=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecpdemodockets:DOC|The Hive Snapshot job is under progress for ecpdemodockets.NovusDoc and the count of completed collections is" Venus1 | awk -F ' : ' '{print $2}')
Venus8=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecpdemodockets:DOC' Venus1 | awk -F ' : ' '{print $2}')
Venus9=$(grep 'The number of ecpdemolglnov.NovusNorm collections got re-exported successfully' Venus | awk -F ' : ' '{print $2}')
Venus10=$(grep 'The number of ecpdemolglnov.NovusDoc collections got re-exported successfully' Venus | awk -F ' : ' '{print $2}')
Venus11=$(grep 'The number of ecpdemolglnov.NovusNims collections got re-exported successfully' Venus1 | awk -F ' : ' '{print $2}')
Venus12=$(grep 'The number of ecpdemodockets.NovusDoc collections got re-exported successfully' Venus1 | awk -F ' : ' '{print $2}')
Venus13=$(grep 'The number of ecpdemolglnov.NovusNorm collections failed to get re-export successfully' Venus | awk -F ' : ' '{print $2}')
Venus14=$(grep 'The number of ecpdemolglnov.NovusDoc collections failed to get re-export successfully' Venus | awk -F ' : ' '{print $2}')
Venus15=$(grep 'The number of ecpdemolglnov.NovusNims collections failed to get re-export successfully' Venus1 | awk -F ' : ' '{print $2}')
Venus16=$(grep 'The number of ecpdemodockets.NovusDoc collections failed to get re-export successfully' Venus1 | awk -F ' : ' '{print $2}')


echo "<td <center>$Venus7</center></td>"
echo "<td <center>$Venus8</center></td>"
echo "<td <center>$Venus12</center></td>"
echo "<td <center>$Venus16</center></td>"
echo "<td <center>$Venus3</center></td>"
echo "<td <center>$Venus4</center></td>"
echo "<td <center>$Venus10</center></td>"
echo "<td <center>$Venus14</center></td>"
echo "<td <center>$Venus5</center></td>"
echo "<td <center>$Venus6</center></td>"
echo "<td <center>$Venus11</center></td>"
echo "<td <center>$Venus15</center></td>"
echo "<td <center>$Venus1</center></td>"
echo "<td <center>$Venus2</center></td>"
echo "<td <center>$Venus9</center></td>"
echo "<td <center>$Venus13</center></td>"
#done
echo '</tr>'



echo '<tr bgcolor="#FFFFFF">
<td  <center>  Mercury </center>  </td>'

#for i in ecplglnov:NovusNorm;
#do
Mercury1=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecplglnov:NORM|The Hive Snapshot job is under progress for ecplglnov.NovusNorm and the count of completed collections is" Mercury | awk -F ' : ' '{print $2}')
Mercury2=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecplglnov:NORM' Mercury | awk -F ' : ' '{print $2}')
Mercury3=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecplglnov:DOC|The Hive Snapshot job is under progress for ecplglnov.NovusDoc and the count of completed collections is" Mercury | awk -F ' : ' '{print $2}')
Mercury4=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecplglnov:DOC' Mercury | awk -F ' : ' '{print $2}')
Mercury5=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecplglnov:NIMS|The Hive Snapshot job is under progress for ecplglnov.NovusNims and the count of completed collections is" Mercury1 | awk -F ' : ' '{print $2}')
Mercury6=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecplglnov:NIMS' Mercury1 | awk -F ' : ' '{print $2}')
Mercury7=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecpdockets:DOC|The Hive Snapshot job is under progress for ecpdockets.NovusDoc and the count of completed collections is" Mercury1 | awk -F ' : ' '{print $2}')
Mercury8=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecpdockets:DOC' Mercury1 | awk -F ' : ' '{print $2}')
Mercury9=$(grep 'The number of ecplglnov.NovusNorm collections got re-exported successfully' Mercury | awk -F ' : ' '{print $2}')
Mercury10=$(grep 'The number of ecplglnov.NovusDoc collections got re-exported successfully' Mercury | awk -F ' : ' '{print $2}')
Mercury11=$(grep 'The number of ecplglnov.NovusNims collections got re-exported successfully' Mercury1 | awk -F ' : ' '{print $2}')
Mercury12=$(grep 'The number of ecpdockets.NovusDoc collections got re-exported successfully' Mercury1 | awk -F ' : ' '{print $2}')
Mercury13=$(grep 'The number of ecplglnov.NovusNorm collections failed to get re-export successfully' Mercury | awk -F ' : ' '{print $2}')
Mercury14=$(grep 'The number of ecplglnov.NovusDoc collections failed to get re-export successfully' Mercury | awk -F ' : ' '{print $2}')
Mercury15=$(grep 'The number of ecplglnov.NovusNims collections failed to get re-export successfully' Mercury1 | awk -F ' : ' '{print $2}')
Mercury16=$(grep 'The number of ecpdockets.NovusDoc collections failed to get re-export successfully' Mercury1 | awk -F ' : ' '{print $2}')


echo "<td <center>$Mercury7</center></td>"
echo "<td <center>$Mercury8</center></td>"
echo "<td <center>$Mercury12</center></td>"
echo "<td <center>$Mercury16</center></td>"
echo "<td <center>$Mercury3</center></td>"
echo "<td <center>$Mercury4</center></td>"
echo "<td <center>$Mercury10</center></td>"
echo "<td <center>$Mercury14</center></td>"
echo "<td <center>$Mercury5</center></td>"
echo "<td <center>$Mercury6</center></td>"
echo "<td <center>$Mercury11</center></td>"
echo "<td <center>$Mercury15</center></td>"
echo "<td <center>$Mercury1</center></td>"
echo "<td <center>$Mercury2</center></td>"
echo "<td <center>$Mercury9</center></td>"
echo "<td <center>$Mercury13</center></td>"
#done
echo '</tr>'


echo '<tr bgcolor="#FFFFFF">
<td  <center>  Neptune </center>  </td>'

#for i in ecplglnov:NovusNorm;
#do
Neptune1=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecplglnov:NORM|The Hive Snapshot job is under progress for ecplglnov.NovusNorm and the count of completed collections is" Neptune | awk -F ' : ' '{print $2}')
Neptune2=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecplglnov:NORM' Neptune | awk -F ' : ' '{print $2}')
Neptune3=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecplglnov:DOC|The Hive Snapshot job is under progress for ecplglnov.NovusDoc and the count of completed collections is" Neptune | awk -F ' : ' '{print $2}')
Neptune4=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecplglnov:DOC' Neptune | awk -F ' : ' '{print $2}')
Neptune5=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecplglnov:NIMS|The Hive Snapshot job is under progress for ecplglnov.NovusNims and the count of completed collections is" Neptune1 | awk -F ' : ' '{print $2}')
Neptune6=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecplglnov:NIMS' Neptune1 | awk -F ' : ' '{print $2}')
Neptune7=$(egrep "Total number of collections got Successfully Hive Snapsorted in ecpdockets:DOC|The Hive Snapshot job is under progress for ecpdockets.NovusDoc and the count of completed collections is" Neptune1 | awk -F ' : ' '{print $2}')
Neptune8=$(grep 'Total number of collections Failed to get Hive Snapsorted in ecpdockets:DOC' Neptune1 | awk -F ' : ' '{print $2}')
Neptune9=$(grep 'The number of ecplglnov.NovusNorm collections got re-exported successfully' Neptune | awk -F ' : ' '{print $2}')
Neptune10=$(grep 'The number of ecplglnov.NovusDoc collections got re-exported successfully' Neptune | awk -F ' : ' '{print $2}')
Neptune11=$(grep 'The number of ecplglnov.NovusNims collections got re-exported successfully' Neptune1 | awk -F ' : ' '{print $2}')
Neptune12=$(grep 'The number of ecpdockets.NovusDoc collections got re-exported successfully' Neptune1 | awk -F ' : ' '{print $2}')
Neptune13=$(grep 'The number of ecplglnov.NovusNorm collections failed to get re-export successfully' Neptune | awk -F ' : ' '{print $2}')
Neptune14=$(grep 'The number of ecplglnov.NovusDoc collections failed to get re-export successfully' Neptune | awk -F ' : ' '{print $2}')
Neptune15=$(grep 'The number of ecplglnov.NovusNims collections failed to get re-export successfully' Neptune1 | awk -F ' : ' '{print $2}')
Neptune16=$(grep 'The number of ecpdockets.NovusDoc collections failed to get re-export successfully' Neptune1 | awk -F ' : ' '{print $2}')


echo "<td <center>$Neptune7</center></td>"
echo "<td <center>$Neptune8</center></td>"
echo "<td <center>$Neptune12</center></td>"
echo "<td <center>$Neptune16</center></td>"
echo "<td <center>$Neptune3</center></td>"
echo "<td <center>$Neptune4</center></td>"
echo "<td <center>$Neptune10</center></td>"
echo "<td <center>$Neptune14</center></td>"
echo "<td <center>$Neptune5</center></td>"
echo "<td <center>$Neptune6</center></td>"
echo "<td <center>$Neptune11</center></td>"
echo "<td <center>$Neptune15</center></td>"
echo "<td <center>$Neptune1</center></td>"
echo "<td <center>$Neptune2</center></td>"
echo "<td <center>$Neptune9</center></td>"
echo "<td <center>$Neptune13</center></td>"
#done
echo '</tr>'
echo '</body></html>'

echo "&nbsp"
echo "&nbsp"
echo '<html>'
echo '<body>'
echo '<a href="https://trten.sharepoint.com/sites/AMS-Novus/AMSNOVUS%20WIKI/Hive%20Snapshot.aspx">For Troubleshooting Click Here.</a>'
echo '</body></html>'

)| /usr/sbin/sendmail -t

rm Venus Venus1 Mercury Mercury1 Neptune Neptune1
