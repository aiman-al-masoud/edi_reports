# parameters
WEBSITE='https://web.unipv.it'

# copy some text from a text-field at the specified coordinates
function copyFromScreen(){
    xdotool mousemove $1 $2
    xdotool click --repeat 3  1
    sleep 1
    xdotool key Ctrl+C
    xclip -o
    echo ""
}


firefox $WEBSITE
sleep 1

xdotool key Super+Up # maximize win
xdotool key Ctrl+Shift+E # open up network monitor
sleep 2

# assume cache is enabled (checkbox UNticked)

xdotool key F5 # reload
sleep 3 
# get number of requests (bottom left)
copyFromScreen 131 750
xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
# get PLT ('Finish')
copyFromScreen 549 750
xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
sleep 2

# disable cache and repeat experiment 
xdotool mousemove 978 507
sleep 1
xdotool click 1
sleep 2

xdotool key F5 # reload
sleep 3 
# get number of requests (bottom left)
copyFromScreen 131 750
xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
# get PLT ('Finish')
copyFromScreen 549 750
xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
sleep 2