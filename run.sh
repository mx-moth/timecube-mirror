#!/bin/bash

HERE=$( dirname "$( readlink -e $0 )" )
cd $HERE

source ./env.sh

./spider.sh
code=$?

if [[ "$code" -ne 0 && $code -ne 8 ]] ; then
	die $code "Error fetching server response"
fi

if [[ $(git status --porcelain -- "${OUTPUT_DIRECTORY}" ) != "" ]] ; then
	git add -A "${OUTPUT_DIRECTORY}"
	git commit \
		--quiet \
		--message "${ENDPOINT_URL} as of ${DATE_STRING}"
	git push origin --quiet
fi
