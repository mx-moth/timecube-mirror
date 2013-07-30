#!/bin/bash

function join() {
	delimiter="$1"
	shift

	out=$( printf "${delimiter}%s" "$@" )
	echo ${out:1}

	return 0
}

ENDPOINT_DOMAIN="www.timecube.com"
ALLOWED_DOMAINS=( \
	"timecube.com" \
	"www.timecube.com" \
	"www.TheWisestHuman.com" \
	"www.thewisesthuman.com" \
)
ALLOWED_DOMAINS=$( join "," "${ALLOWED_DOMAINS[@]}" )

HERE=$( readlink -e $( dirname $0 ) )
LOG_FILE="${HERE}/wget.log"
OUTPUT_DIRECTORY="${HERE}/site/"
DATE_STRING=$( date --utc --rfc-3339=seconds )

ENDPOINT_URL="http://${ENDPOINT_DOMAIN}/"

WGET="wget
	--output-file=${LOG_FILE}
	--no-verbose
	--mirror
	--domains=${ALLOWED_DOMAINS}
	--span-hosts
	--"

GIT_SSH="ssh -i '${HERE}/deployment-key'"
