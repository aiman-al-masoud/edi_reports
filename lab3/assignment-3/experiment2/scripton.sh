# parameters
WEBSITE='https://web.unipv.it'
NUM_REQ_COORDS="131 750"
FINISH_COORDS="549 750"
CACHE_CHECK_BOX_COORDS="978 507"

# copy some text from a text-field at the specified coordinates
function copyFromScreen(){
    xdotool mousemove $1 $2
    xdotool click --repeat 3  1
    sleep 1
    xdotool key Ctrl+C
    xclip -o
    echo ""
}

# reload the page and get the data from the screen
function runExperiment(){
    xdotool key F5 # reload
    sleep 3 
    # get number of requests (bottom left)
    copyFromScreen $NUM_REQ_COORDS
    xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
    # get PLT ('Finish')
    copyFromScreen $FINISH_COORDS
    xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
    sleep 2   
}

# toggle the cache checkbox on firefox assuming network monitor is open
function toggleCache(){
    xdotool mousemove $CACHE_CHECK_BOX_COORDS
    sleep 1
    xdotool click 1
    sleep 2
}

# main starts here
firefox $WEBSITE
sleep 1

xdotool key Super+Up # maximize win
xdotool key Ctrl+Shift+E # open up network monitor
sleep 2

# assume cache is enabled (checkbox UNticked)
echo '----------with cache----------'
runExperiment
# turn cache off and repeat experiment
toggleCache
echo '----------without cache----------'
runExperiment
# turn cache back on
toggleCache 