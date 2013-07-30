#!/bin/bash

source env.sh

cd "${HERE}"
./spider.sh
if [[ $(git status --porcelain -- "${OUTPUT_DIRECTORY}" ) != "" ]] ; then
	git add -A "${OUTPUT_DIRECTORY}"
	git commit \
		--quiet \
		--message "${ENDPOINT_URL} as of ${DATE_STRING}"
	git push origin --quiet
fi
