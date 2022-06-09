N=5 # repeats
 
# Mainly HTTP1

./scripton.sh  https://web.unipv.it/ $N  >> dump.txt

./scripton.sh  https://www.pythonanywhere.com/ $N >> dump.txt

./scripton.sh  https://www.mit.edu/ $N >> dump.txt

# Mainly HTTP2

./scripton.sh  https://github.com/ $N >> dump.txt 

./scripton.sh https://archive.org/ $N >> dump.txt

./scripton.sh https://stackoverflow.com/ $N >> dump.txt


# Unsecure (HTTP1)

./scripton.sh  http://maxgames.com/ $N >> dump.txt 

./scripton.sh  http://go.com/ $N >> dump.txt 

./scripton.sh  http://mclab.unipv.it/ $N >> dump.txt 