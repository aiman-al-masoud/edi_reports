TARGET="www.google.com"
TRACEROUTE_BUFFER="traceroute$(date +%s).txt"

INTERVAL=$((5*60))  #every 5 minutes

while true
do
echo "START" >> $TRACEROUTE_BUFFER 
echo $(date +%s) >> $TRACEROUTE_BUFFER  # seconds since unix epoch (in GMT)
traceroute $TARGET >> $TRACEROUTE_BUFFER # with udp
# sudo traceroute -T $TARGET >> $TRACEROUTE_BUFFER # with tcp
sleep $INTERVAL
done








