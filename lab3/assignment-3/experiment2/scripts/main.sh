N=5 # repeats
 
# Mainly HTTP1

./scripton.sh  https://web.unipv.it/ $N  >> http1.txt

./scripton.sh  https://www.pythonanywhere.com/ $N >> http1.txt

./scripton.sh  https://www.mit.edu/ $N >> http1.txt

# Mainly HTTP2

./scripton.sh  https://github.com/ $N >> http2.txt 

./scripton.sh https://archive.org/ $N >> http2.txt

./scripton.sh https://stackoverflow.com/ $N >> http2.txt


# Unsecure (HTTP1)

./scripton.sh  http://maxgames.com/ $N >> unsecure.txt 

./scripton.sh  http://go.com/ $N >> unsecure.txt 

./scripton.sh  http://mclab.unipv.it/ $N >> unsecure.txt 