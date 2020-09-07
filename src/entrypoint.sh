#!/bin/bash

#if [[ -z "$GITHUB_TOKEN" ]]; then
#	echo "The GITHUB_TOKEN is required."
#	exit 1
#fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nxxm/nxxm/master/install/install_for_macos_linux.sh)"

FILES_LINK=`jq -r '.pull_request._links.self.href' "$GITHUB_EVENT_PATH"`/files
echo "Files = $FILES_LINK"

curl $FILES_LINK > files.json
FILES_URLS_STRING=`jq -r '.[].raw_url' files.json`

readarray -t URLS <<<"$FILES_URLS_STRING"

echo "File names: $URLS"

mkdir /usr/local/files
cd /usr/local/files
for i in "${URLS[@]}"
do
   echo "Downloading $i"
   curl -LOk --remote-name $i 
done

echo "Files downloaded!"
var_path_directory="/usr/local/files"

/usr/local/bin/nxxm $var_path_directory  -t gcc-7-cxx17 --verbose 
