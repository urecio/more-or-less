
#########################################################
################### START CONFIG ########################

## set files and path ##############
## modify these to fit your needs ##

## locaion of less files ###########
lessPath="test"

## locaion of css files ############
cssPath="test"

## name of less file ###############
inputFile="test.less"

## name of css files ###############
outputFile="test.css"

#################### END CONFIG #########################
#########################################################

#########################################################
## NO MODIFICATIONS SHOULD BE NEEDED BEYOND THIS POINT ##

#########################################################
################### START SCRIPT ########################

## name of script
SCRIPTNAME="$0"

## build filePath + fileName
INPUT="${lessPath}/${inputFile}"
OUTPUT="${cssPath}/${outputFile}"

## flag to check if command was sucessfully executed
COMPLETED="NO"

## helpers for logging
LINEBREAK=$(for i in $(seq 1 80); do printf "-"; done)

## define PARAMETER
PARAMETER=""

if [ -n "${2}" ] ; then
	if [ ${2} = "-m" ] || [ ${2} = "-mediaquery" ] ; then
		PARAMETER="--line-numbers=mediaquery"
	elif [ ${2} = "-c" ] || [ ${2} = "-comments" ] ; then
		PARAMETER="--line-numbers=comments"
	elif [ ${2} = "-a" ] || [ ${2} = "-all" ] ; then
		PARAMETER="--line-numbers=all"
	fi
fi


## notify on compilation success
## works for once
NOTIFYTITLE="Sucess"
NOTIFYSUBTITLE="$(date)"
NOTIFYMESSAGE="Compiled: ${inputFile}"

function notify () {
	terminal-notifier -title "${NOTIFYTITLE}" -subtitle "${NOTIFYSUBTITLE}" -message "${NOTIFYMESSAGE}"
}
## works for watch
notify="terminal-notifier \
-title \"${NOTIFYTITLE}\" \
-subtitle \"${NOTIFYSUBTITLE}\" \
-message \"${NOTIFYMESSAGE}\""



## will compile files with given parameters
function compile-less () {
	echo "start compiling less files"
	echo "${LINEBREAK}"
	lessc ${PARAMETER} ${INPUT} ${OUTPUT} && COMPLETED="YES"
	if [ ${COMPLETED} = "YES" ] ; then
		echo "${INPUT} > ${OUTPUT}"
		echo "${LINEBREAK}"
		notify
	else
		echo "seems like something went wrong"
	fi
}
## will compile files with given parameters
## and then watch for changes
function watch-less () {
	## fist compile the files
	compile-less
	## use observr to watch files
	observr -e "; \
	puts 'start watching less files'; \
	puts '-' * 80; \
	watch('.*\.less') \
	{ cmd = 'lessc ${PARAMETER} ${INPUT} ${OUTPUT}'; \
	log = 'echo \"${INPUT} > ${OUTPUT}\" && ${notify}'; \
	o = \`#{cmd}\`; \
	l = \`#{log}\`; \
	puts o << l;}"
}

## provide error message
function illegal-option (){
	echo "illegal option"
	echo "use '--help' to show options"
}

## output help when requested
function show-help () {
	echo "${SCRIPTNAME} [OPTION] [PARAMETER]"
	echo ""
	echo "OPTION---------------------HELP-------------------------------"
	echo "watch                      watch files"
	echo "once                       compile files once"
	echo ""
	echo "PARAMETER------------------HELP-------------------------------"
	echo "-c, --comments             output comments"
	echo "-m, --mediaquery           output mediaquery"
	echo "-a, --all                  output comments & mediaquery"
	echo ""
	echo "--------------------------------------------------------------"
	echo "-h, --help                 Print help (this message) and exit."
	echo "--------------------------------------------------------------"
}

## keep this small and modular ##
#################################

## only execute if option is set
if [ -n "${1}" ] ; then
	echo ""
	if [ ${1} = "-h" ] || [ ${1} = "--help" ] ; then
		show-help
	elif [ ${1} = "watch" ] ; then
		watch-less
	elif [ ${1} = "once" ] ; then
		compile-less
	else
		illegal-option
	fi
## otherwise display help #########
else
	show-help
fi

#################### END SCRIPT #########################
#########################################################
