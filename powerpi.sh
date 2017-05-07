#!/bin/bash

DATE=$(date +%F)
SUBJECT_DATE=$(date +"%A %d %b %Y")
EMAIL_SUBJECT="Power left - $SUBJECT_DATE"
FILENAME="$DATE.jpg"
DIR="/home/pi/powerpi/"

# Email recipient(s) (Comma separated recipients)
RECIPIENTS="user@gmail.com"

# Check dependencies
command -v /usr/bin/raspistill >/dev/null 2>&1 || { echo >&2 "Requires raspistill but it's not installed. Aborting."; exit 1; }
command -v /usr/bin/mpack >/dev/null 2>&1 || { echo >&2 "Requires mpack but it's not installed. Aborting."; exit 1; }
command -v /usr/sbin/ssmtp >/dev/null 2>&1 || { echo >&2 "Requires ssmtp but it's not installed. Aborting."; exit 1; }

# Take photo of power left
echo "Taking photo... takes 7 seconds"

# Night mode, flip vertically and horizontally
raspistill --exposure night --vflip --hflip --width 650 --height 450 --timeout 7000 --brightness 57 --sharpness 75 --output "${DIR}${FILENAME}"

# Email the captured photo
mpack -s "$EMAIL_SUBJECT" -c image/jpeg ${DIR}${FILENAME} "$RECIPIENTS"

if [ "$?" -eq 0 ]
then
	echo "Photo emailed successfully to $RECIPIENTS"
else
	echo "Failed to send email to $RECIPIENTS"
fi

# Delete the photo
rm "${DIR}${FILENAME}"

if [ "$?" -eq 0 ]
then
	echo "Photo deleted successfully"
fi
