#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nxxm/nxxm/master/install/install_for_macos_linux.sh)"

cd $GITHUB_WORKSPACE
/usr/local/bin/nxxm $GITHUB_WORKSPACE  -t gcc-7-cxx17 --verbose 
if [ $? -ne 0 ]; then
echo "An error has occurred."
echo "Please look at the logs."
	exit 1
fi

zip -r build.zip ./build

echo '************************ test luc ************************'
echo "$INPUT_TARGET" 
echo "$INPUT_CONFIGURATION"
echo "$INPUT_ONLY_EXE"
echo "$INPUT_CPUS"





