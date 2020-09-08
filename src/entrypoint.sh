#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nxxm/nxxm/master/install/install_for_macos_linux.sh)"

cd $GITHUB_WORKSPACE
/usr/local/bin/nxxm $GITHUB_WORKSPACE  -t gcc-7-cxx17 --verbose 





