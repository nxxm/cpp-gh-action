#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nxxm/nxxm/master/install/install_for_macos_linux.sh)"

var_path_directory=""


/usr/local/bin/nxxm $var_path_directory  -t gcc-7-cxx17 --verbose 
