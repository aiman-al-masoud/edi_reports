
#wget -r https://www.youtube.com/ 2> crap.txt
#--save-headers

#wget -r --save-headers https://www.youtube.com/ 

WEBSITE='http://www.youtube.com'
TIMEOUT=3

if [ "$1" ]
then
WEBSITE=$1
fi

# with recursion
wget --timeout=$TIMEOUT --server-response --spider -r $WEBSITE  2> dump.txt

#cat dump.txt  | egrep "Cache-Control|Content-Length"

# without recursion
#wget --server-response --spider $WEBSITE 2> dump.txt
