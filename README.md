# powerpi
Raspberry Pi Prepaid Electricity monitor takes a photo of the amount of money you have left and emails it to you at a predefined time via a cronjob.

# Install
Clone to the ~/powerpi directory on your Raspberry Pi

# Dependencies
- Raspberry Pi (any)
- Raspberry Pi camera module (any)

# Package dependencies
- raspistill
- ssmtp
- mpack

# Configure
- Replace RECIPIENTS="user@gmail.com" with your email address
- Play with the settings passed to 'raspistill'.
- Enable the camera by running: 'sudo raspi-config'

# SSMTP settings
```bash
# Config located: /etc/ssmtp/ssmtp.conf
root=postmaster
mailhub=smtp.gmail.com:587
rewriteDomain=gmail.com
FromLineOverride=YES
UseSTARTTLS=YES
# Replace with your Gmail username
AuthUser=user@gmail.com
# Replace with your application specific password: https://security.google.com/settings/security/apppasswords
AuthPass=
```

# Example Cron
Edit your crontab and paste the following command
```bash
crontab -e
```

```bash
# Run daily at 20:00
0 20 * * * /home/pi/powerpi/powerpi.sh >/dev/null 2>/dev/null
```

#Bash alias
```bash
Edit ~/.bashrc
```

```bash
# Run on demand
alias elec='sh /home/pi/powerpi/powerpi.sh'
```
