# args
WEBSITE=$1 # website to experiment on 
REPEAT_EXPERIMENT=$2 # number of times experiment is repeated for each condition

# default args
WEBSITE=${WEBSITE:-'https://web.unipv.it'}
REPEAT_EXPERIMENT=${REPEAT_EXPERIMENT:-1}

# parameters
NUM_REQ_COORDS="131 750"
FINISH_COORDS="549 750"
CACHE_CHECK_BOX_COORDS="978 507"
LOAD_PAGE_WAIT=3 # max time to wait for page to load

# flags
CACHE_ON=1 # +1 true -1 false

# copy some text from a text-field at the specified coordinates
function copyFromScreen(){
    xdotool mousemove $1 $2
    xdotool click --repeat 3  1
    sleep 1
    xdotool key Ctrl+C
    xclip -o
}

# reload the page and get the data from the screen for $1 times
function runExperiment(){
    for (( c=0; c<$1; c++ ))
        do 
            xdotool key F5 # reload
            sleep $LOAD_PAGE_WAIT
            # get number of requests (bottom left)
            echo "{"
            echo '"website":"'$WEBSITE'",'
            echo -n '"number_requests":'
            echo  $(copyFromScreen $NUM_REQ_COORDS) | egrep -o '[0-9]+' | tr -d "\n" 
            echo ","   
            xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
            echo  -n '"cache":'
            echo  $CACHE_ON','
            # get PLT ('Finish')
            echo -n '"plt_seconds":'
            echo  $(copyFromScreen $FINISH_COORDS) | egrep -o '[0-9]+\.[0-9]+'
            echo "}"
            echo "--------------------------------------------"
            xdotool key Ctrl+Shift+E # re-open network monitor (just in case)
            sleep 2  
        done
}

# toggle the cache checkbox on firefox assuming network monitor is open
function toggleCache(){
    xdotool mousemove $CACHE_CHECK_BOX_COORDS
    sleep 1
    xdotool click 1
    sleep 2
    CACHE_ON=$(( -1 * $CACHE_ON ))
}

# done message on a new Firefox tab
function doneMessage(){
    xdotool key Ctrl+t
    xdotool type 'all done!'
    xdotool key Return
}

# main starts here
firefox $WEBSITE
sleep 1

xdotool key Super+Up # maximize win
xdotool key Ctrl+Shift+E # open up network monitor
sleep 2


# assume cache is enabled (checkbox UNticked)
runExperiment $REPEAT_EXPERIMENT
# turn cache off and repeat experiment
toggleCache
runExperiment $REPEAT_EXPERIMENT
# turn cache back on
toggleCache 
# all done 
doneMessage