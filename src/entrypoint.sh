#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

if [[ "$INPUT_NEED_SECRET" == "enable" ]]; then 
cd /github/home/
 mkdir -p ./.nxxm
 	if [ -n "$NXXM_AUTH" ]; then
            echo "$NXXM_AUTH" > /github/home/.nxxm/.auth
	fi
fi 
var_dir="$GITHUB_WORKSPACE""$INPUT_DIR"

nxxm $var_dir $INPUT_TARGET  $INPUT_TEST $INPUT_CONFIG $INPUT_EXCLUDE $INPUT_JOBS $INPUT_EXCLUDE_TEST $INPUT_EXTRA_ARGS $INPUT_USE_CMAKELISTS
if [ $? -ne 0 ]; then
echo "An error has occurred."
echo "Please look at the logs."
	exit 1
fi





