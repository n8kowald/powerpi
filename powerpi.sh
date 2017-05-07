#!/bin/bash

DATE=$(date +%F)
SUBJECT_DATE=$(date +"%A %d %b %Y,%r")
FILENAME="$DATE.jpg"
DIR="/home/pi/powerpi/"

# Email recipient(s) (Comma separated recipients)
RECIPIENTS="user@gmail.com"

# Check dependencies
command -v raspistill >/dev/null 2>&1 || { echo >&2 "Requires raspistill but it's not installed. Aborting."; exit 1; }
command -v mpack >/dev/null 2>&1 || { echo >&2 "Requires mpack but it's not installed. Aborting."; exit 1; }
command -v ssmtp >/dev/null 2>&1 || { echo >&2 "Requires ssmtp but it's not installed. Aborting."; exit 1; }

# Take photo of power left
echo "Taking photo... takes 7 seconds"

# Night mode, flip vertically and horizontally
raspistill -ex night -vf -hf -w 650 -h 450 -o "${DIR}${FILENAME}" -t 7000 -br 57 -sh 75

# Email the captured photo
mpack -s "Power left - $SUBJECT_DATE" -c image/jpeg ${DIR}${FILENAME} "$RECIPIENTS"

EXIT_CODE=$?
if [ "$EXIT_CODE" -eq 0 ]
then
	echo "Photo emailed successfully to $RECIPIENTS"
else
	echo "Failed to send email to $RECIPIENTS"
fi

# Delete the photo
rm ${DIR}${FILENAME}

EXIT_CODE=$?
if [ "$EXIT_CODE" -eq 0 ]
then
	echo "Photo deleted successfully"
fi
