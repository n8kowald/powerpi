# powerpi
Raspberry Pi Prepaid Electricity Monitor

# Install
Clone to a directory on your Raspberry Pi

# Dependencies
- raspistill
- ssmtp
- mpack

# Cron
crontab -e
0 20 * * * /home/pi/powerpi/powerpi.sh >/dev/null 2>/dev/null
