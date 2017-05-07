# powerpi
Raspberry Pi Prepaid Electricity monitor takes a photo of the amount of money you have left and emails it to you at a predefined time via a cronjob.

# Install
Clone to the ~/powerpi directory on your Raspberry Pi

# Dependencies
- Raspberry Pi (any)
- Raspberry Pi camera module (any)
- Enabled camera module, run: 'sudo raspi-config'

# Package dependencies
- raspistill
- ssmtp
- mpack

# Configure
- Replace RECIPIENTS="user@gmail.com" with your email address
- Play with the settings passed to 'raspistill'.

# SSMTP settings
```bash
# Config located: /etc/ssmtp/ssmtp.conf
root=postmaster
mailhub=smtp.gmail.com:587
rewriteDomain=gmail.com
FromLineOverride=YES
UseSTARTTLS=YES
# Replace user with your Gmail username
AuthUser=user@gmail.com
# Replace with your application specific password: https://security.google.com/settings/security/apppasswords
AuthPass=
```

# Example Cron
Edit your crontab and paste the following command
```bash
# Edit crontab
crontab -e
```

```bash
# Run daily at 20:00 - generate a different time here: http://crontab-generator.org
0 20 * * * /home/pi/powerpi/powerpi.sh >/dev/null 2>/dev/null
```

# Alias
```bash
# Edit your ~/.bashrc
Edit ~/.bashrc

# Paste the following to run the script on demand
alias elec='sh /home/pi/powerpi/powerpi.sh'
```
