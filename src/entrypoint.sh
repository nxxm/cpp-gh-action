#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nxxm/nxxm/master/install/install_for_macos_linux.sh)"

cd $GITHUB_WORKSPACE

echo "*************************** 1 ************************"

echo "$INPUT_TARGET"
echo "$INPUT_CONFIG"
echo "$INPUT_JOBS"
echo "$INPUT_USE_CMAKELISTS"
echo "$INPUT_ONLY_EXE"
echo "*************************** 2 ************************"



 /usr/local/bin/nxxm $GITHUB_WORKSPACE  -t $INPUT_TARGET $INPUT_USE_CMAKELISTS -C $INPUT_CONFIGURATION -j $INPUT_JOBS  $INPUT_ONLY_EXE --verbose 
 if [ $? -ne 0 ]; then
echo "An error has occurred."
echo "Please look at the logs."
	exit 1
fi



zip -r build.zip ./build






