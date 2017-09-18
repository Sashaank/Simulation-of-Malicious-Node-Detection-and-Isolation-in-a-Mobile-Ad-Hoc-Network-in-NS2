#============================= throughput.awk ========================

BEGIN {
recv=0;
gotime = 1;
time = 0;
packet_size = 1000;
time_interval=2;
}
#body
{
        event = $1
             time = $2
             node_id = $3
             level = $4
             pktType = $7

 if(time>gotime) {

  print gotime, (packet_size * recv * 8.0)/1000; #packet size * ... gives results in kbps
  gotime+= time_interval;
  recv=0;
  }

#============= CALCULATE throughput=================

if (( event == "r") && ( pktType == "cbr" ) && ( level=="AGT" ))
{
 recv++;
}

} #body


END {
;
}
#============================= Ends ============================

