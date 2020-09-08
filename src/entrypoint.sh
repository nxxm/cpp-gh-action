#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nxxm/nxxm/master/install/install_for_macos_linux.sh)"


var_path_directory="/usr/bin/git"
var_path_directory2="/usr/bin/git"
var_path_directory3="/usr/bin/git"



echo "************************* 1 *************************"
/usr/local/bin/nxxm /home/runner/work/sandbox/sandbox  -t gcc-7-cxx17 --verbose 
echo "************************* 2 *************************"
/usr/local/bin/nxxm /home/runner/work/sandbox/sandbox/.git  -t gcc-7-cxx17 --verbose 
echo "************************* 3 *************************"
/usr/local/bin/nxxm /usr/bin/git  -t gcc-7-cxx17 --verbose 




