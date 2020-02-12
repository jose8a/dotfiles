#!/bin/sh

# =================================================================
# REFERENCES
# =================================================================
# * [Use Terminal as an Alarm Clock](https://helpdeskgeek.com/linux-tips/terminal-tricks-use-the-terminal-as-an-alarm-clock/)


# =================================================================
# DEFAULTS
# =================================================================
APP=""
FILEPATH=""
QUICKNOTE=""
NOTESLOG="/Users/jose8a/jbdg/notes/dodos/.dodos.log"

HELP=""
VERBOSE=""

MSG_SEPARATOR="${colLGY}\t....................${NC}\n"

# =================================================================
# COLOR-DEFINITIONS
# =================================================================

# colors for better message visibility on the commandline
# REFERENCE: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
colRED='\033[0;31m'     # normal red
colYLW='\033[1;33m'     # normal yellow
colGRN='\033[0;32m'     # normal green
colBLU='\033[0;34m'     # normal blue

colLGY='\033[0;37m'     # light grey
colDGY='\033[1;30m'     # dark grey
colLBL='\033[1;34m'     # light blue
colLCY='\033[1;36m'     # light cyan
colLGR='\033[1;32m'     # light green
colLRD='\033[1;31m'     # light red
NC='\033[0m'            # No Color


# =================================================================
# UTILITY-FUNCTIONS
# =================================================================

# Define a timestamp function
ts() {
  date +"%Y-%m-%d_%H-%M-%S"
}

show_help() {
  echo "${colYLW}Usage: badgelist_timer | blt [options] ${NC}"
  echo ""
  echo "${colYLW}Basic Options:${NC}"
  echo "\t${colLCY}-a <app>        ${NC}\t app or script to call at timer timeout"
  echo "\t${colLCY}-f <filepath>   ${NC}\t pathname of file (only if app requires it)"
  echo "\t${colLCY}-n <task-desc>  ${NC}\t task description to store into logfile"
  echo "\t${colLCY}-t <time-value> ${NC}\t length of time until timer timeout"
  echo ""
  echo "${colYLW}App Options:${NC}"
  echo "\t${colLCY}yt               ${NC}\t a random youtube video via browser"
  echo "\t${colLCY}jt               ${NC}\t a random song on the local machine"
  echo "\t${colLCY}wb               ${NC}\t a random cool website"
  echo ""
  echo "${colYLW}Time Options:${NC}"
  echo "\t${colLCY}0-59s            ${NC}\t timer length between 0 and 59 seconds"
  echo "\t${colLCY}1-59m            ${NC}\t timer length between 1 and 59 minutes"
  echo "\t${colLCY}1-3h             ${NC}\t timer length between 1 and 3 hours"
  echo ""
  echo ""
}

# =================================================================
# RANDOMNESS
# =================================================================

# If you need a random int within a certain range, use the 'modulo' operator.
# This returns the remainder of a division operation.
RANGE=4
rand_song_id=$RANDOM
let "rand_song_id %= $RANGE"


# =================================================================
# AVAILABLE BROWSERS
# =================================================================

# opera/vivaldi/firefox/chrome browser paths - remove or comment out any
#   browser that is not present on your system
opera="open -a /Applications/Opera.app/Contents/MacOS/Opera"
vivaldi="open -a /Applications/Vivaldi.app/Contents/MacOS/Vivaldi"
firefox="open -a /Applications/Firefox.app/Contents/MacOS/firefox"
chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


# =================================================================
# YOUTUBE_ACTIONS
# =================================================================
YT_REVOLUSION="https://www.youtube.com/watch?v=QTRGx6kv3ps"
YT_RINGALARM="https://www.youtube.com/watch?v=8otnEsXHi04"
YT_GLOCKENSPIEL="https://www.youtube.com/watch?v=UDi0KGCv8B4"
YT_VENOM="https://www.youtube.com/watch?v=8CdcCD5V-d8"

WEB_XKCD="https://xkcd.com/archive/"
WEB_OATMEAL="http://theoatmeal.com"
WEB_ZTYPE="https://zty.pe"
WEB_MEDITATE="https://quietkit.com"

TUNES=($YT_REVOLUSION $YT_RINGALARM $YT_GLOCKENSPIEL $YT_VENOM)
WEBS=($WEB_XKCD $WEB_OATMEAL $WEB_ZTYPE $WEB_MEDITATE)

song=${TUNES[$rand_song_id]}
webby=${WEBS[$rand_song_id]}

# generate action to take on ALARM TIMEOUT
ytunz_action="$opera $song"
webby_action="$opera $webby"


# =================================================================
# LOCAL TUNES ACTIONS
# =================================================================

### LOCAL MOBY SONGS in FOLDER:
###   - /Users/jose8a/jtunz/54_Moby_Destroyed/
# 01_-_The_Broken_Places.mp3
# 02_-_Be_The_One.mp3
# 03_-_Sevastopol.mp3
# 04_-_The_Low_Hum.mp3
# 05_-_Rockets.mp3
# 06_-_The_Day.mp3
# 07_-_Lie_Down_In_Darkness.mp3
# 08_-_Victoria_Lucas.mp3
# 09_-_After.mp3
# 10_-_Blue_Moon.mp3
# 11_-_The_Right_Thing.mp3
# 12_-_Stella_Maris.mp3
# 13_-_The_Violent_Bear_It_Away.mp3
# 14_-_Lacrimae.mp3
# 15_-_When_You_Are_Old.mp3
# 16_-_Sandpaper_(Amazon_Exclusive).mp3

jtunz_action="mplayer /Users/jose8a/jtunz/54_Moby_Destroyed/05_-_Rockets.mp3"


# =================================================================
# PROCESS COMMANDLINE ARGUMENTS
# =================================================================
while getopts a:f:n:t:hv option
do
 case "${option}"
 in
 a) APP=${OPTARG};;
 f) FILEPATH=${OPTARG};;
 n) QUICKNOTE=${OPTARG};;
 t) TIME=${OPTARG};;
 h) HELP="TRUE";;
 v) VERBOSE="TRUE";;
 esac
done


case "$APP"
  in
  "yt") ACTION=$ytunz_action;;
  "jt") ACTION=$jtunz_action;;
  "wb") ACTION="$webby_action";;
  *) ACTION=$ytunz_action;;
esac


# =================================================================
# CONVERT TIME
# =================================================================

# --- convert time into seconds to use with the 'sleep' utility
# Valid formats for the '-t <value>'
# e.g. 10s for seconds -  RANGE: 00-59s
# e.g. 10m for minutes -  RANGE: 00-59m
# e.g. 2h for hours -     RANGE: 00-3h

TIME_IN_SECONDS=""

if [[ $TIME =~ ^[0-9][0-9]?s$ ]]; then
  time_base=$(echo $TIME | sed -nE 's/([1-9][0-9]?)s/\1/p')
  let "TIME_IN_SECONDS = $time_base"
fi

if [[ $TIME =~ ^[0-9][0-9]?m$ ]]; then
  time_base=$(echo $TIME | sed -nE 's/([1-9][0-9]?)m/\1/p')
  let "TIME_IN_SECONDS = $time_base * 60"
fi

if [[ $TIME =~ ^[1-3]h$ ]]; then
  time_format="HOURS"
  time_base=$(echo $TIME | sed -nE 's/([1-3])h/\1/p')
  let "TIME_IN_SECONDS = $time_base * 3600"
fi


# show HELP options if help option is set
[ ! -z "$HELP" ] && show_help && exit -1

# if the VERBOSE option is set, enable additional output messages
[ ! -z "$VERBOSE" ] && echo "VERBOSE OUTPUT ENABLED: "
[ ! -z "$VERBOSE" ] && echo "ACTION @TIMEOUT: \n  $ACTION\n"


# =================================================================
# VALIDATIONS
# =================================================================
# Validate the required user inputs -- exit on ERROR
ERROR_MSG_TIMEVALUE_NONE="\n${colRED}ERROR: Task Time not provided${NC}"
ERROR_MSG_TIMEVALUE_INVALID="\n${colRED}ERROR: Task Time FORMAT is INVALID${NC}"
ERROR_MSG_TASKNOTE_NONE="\n${colRED}ERROR: Task DESCRIPTION not provided${NC}"
ERROR_MSG_TIMEVALUE_FORMAT="\n${colRED}ERROR: Task timebox value FORMAT is incorrect${NC}"


# REQUIRED: timebox value for task
# ON_ERROR: provide ERROR msg and exit program
[ -z "$TIME" ] && \
  echo $ERROR_MSG_TIMEVALUE_NONE && \
  echo $MSG_SEPARATOR && \
  show_help && exit -1


# REQUIRED: Invalid format of TIMEBOX VALUE
# ON_ERROR: provide ERROR msg and exit program
[ -z "$TIME_IN_SECONDS" ] && \
  echo $ERROR_MSG_TIMEVALUE_INVALID && \
  echo $MSG_SEPARATOR && \
  show_help && exit -1


# REQUIRED: task description
# ON_ERROR: provide ERROR msg and exit program
[ -z "$QUICKNOTE" ] && \
  echo $ERROR_MSG_TASKNOTE_NONE && \
  echo $MSG_SEPARATOR && \
  show_help && exit -1


# =================================================================
# START TIMER
#   - use `sleep` utility for the timer function
#   - launch an 'ACTION' after timer TIMEOUT
#   - add 'QUICKNOTE' description to LOGFILE
#
# =================================================================

# show HELP options if help option is set
[ ! -z "$HELP" ] && show_help && exit -1

# create notes logfile if not yet exists
touch $NOTESLOG

# run the timer command using the `sleep` utility
sleep $TIME && \
  eval $ACTION &&
  echo "$(ts): $QUICKNOTE" >> $NOTESLOG

