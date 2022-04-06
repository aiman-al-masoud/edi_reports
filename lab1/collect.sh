TARGET="www.google.com"
TRACEROUTE_BUFFER="traceroute$(date +%s).txt"

INTERVAL=2 # in seconds

while true
do
echo "START" >> $TRACEROUTE_BUFFER 
echo $(date +%s) >> $TRACEROUTE_BUFFER  # seconds since unix epoch (in GMT)
# sudo traceroute -T $TARGET >> $TRACEROUTE_BUFFER # with tcp
traceroute $TARGET >> $TRACEROUTE_BUFFER # with udp
sleep $INTERVAL
done








