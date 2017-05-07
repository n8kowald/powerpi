# powerpi
Raspberry Pi Prepaid Electricity monitor takes a photo of the amount of money you have left and emails it to you at a pre-defined time.

# Install
Clone to a directory on your Raspberry Pi

git clone https://github.com/n8kowald/powerpi.git ~/powerpi

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

# SSMTP settings (/etc/ssmtp/ssmtp.conf)
```bash
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
```bash
crontab -e
0 20 * * * /home/pi/powerpi/powerpi.sh >/dev/null 2>/dev/null
```

#Bash alias
Edit ~/.bashrc

```bash
# Run script on demand
alias elec='sh /home/pi/powerpi/powerpi.sh'
```
