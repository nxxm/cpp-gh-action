#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi


var_dir=".""$GITHUB_WORKSPACE""$INPUT_DIR"



echo "****************** 1 ******************"
echo "$GITHUB_WORKSPACE"
echo "****************** 2 ******************"
echo "$INPUT_DIR"
echo "****************** 3 ******************"
echo "$var_dir"


cd "$GITHUB_WORKSPACE"
var_config=$(readlink -f "$var_dir")

nxxm help 
nxxm $var_config $INPUT_TARGET  $INPUT_TEST $INPUT_CONFIG $INPUT_EXCLUDE $INPUT_JOBS $INPUT_EXCLUDE_TEST $INPUT_EXTRA_ARGS $INPUT_USE_CMAKELISTS
 if [ $? -ne 0 ]; then
echo "An error has occurred."
echo "Please look at the logs."
	exit 1
fi





