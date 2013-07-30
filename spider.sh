#!/bin/bash

source env.sh

cd "${HERE}"
touch "${LOG_FILE}"

rm -fR "$OUTPUT_DIRECTORY"
mkdir -p "${OUTPUT_DIRECTORY}"
cd "${OUTPUT_DIRECTORY}"

$WGET $ENDPOINT_URL
