# powerpi
This Raspberry Pi prepaid electricity monitor takes a photo of the amount of money you have left and emails it to you at a predefined time via a cronjob.

![Monitor usage](/docs/example.jpg?raw=true "Prepaid electricity box with powerpi")

# Requirements
- Raspberry Pi (any)
- Raspberry Pi camera module (any)
- Enabled camera module. Run: ```sudo raspi-config``` to enable, then reboot
- Raspberry Pi Wi-Fi Dongle (if using a Raspberry Pi < 3)

# Package dependencies
- raspistill
- ssmtp
- mpack

# Install
Clone to the ``~/powerpi`` directory on your Raspberry Pi
```bash
git clone git@github.com:n8kowald/powerpi.git ~/powerpi
```

## Install ssmtp
```bash
sudo apt-get install ssmtp
```
### SSMTP settings
Edit your SSMTP config

```bash
sudo vim /etc/ssmtp/ssmtp.conf
```

Add or update the following settings
```bash
root=postmaster
mailhub=smtp.gmail.com:587
rewriteDomain=gmail.com
FromLineOverride=YES
UseSTARTTLS=YES
# Replace with your Gmail username
AuthUser=user@gmail.com
# Allow less secure apps to access your account: https://support.google.com/accounts/answer/6010255
# Replace with your application specific password: https://support.google.com/mail/answer/185833
AuthPass=
```

#### Send a test email using your settings (replace user below)
```bash
echo "This is the body" | mail -s "Subject" user@gmail.com
```

SSMTP docs (including how to secure it): https://wiki.archlinux.org/index.php/SSMTP

## Install mpack
```bash
sudo apt-get install mpack
```

## Make shell script executable
```bash
sudo chmod +x ~/powerpi/powerpi.sh
```

# Create the cronjob
Edit your crontab by typing ```crontab -e``` and paste the following command

```bash
# Run daily at 20:00 - generate a different time here: http://crontab-generator.org
0 20 * * * /home/pi/powerpi/powerpi.sh >/dev/null 2>/dev/null
```

# Configure
- Replace ```RECIPIENTS="user@gmail.com"``` with your email address in ```~/powerpi/powerpi.sh```
- Play with the settings passed to 'raspistill' to get the best photo for your light conditions

# Alias (optional)
Trigger the script by typing 'elec', or whatever you want.

```bash
# Edit your ~/.bashrc
vim ~/.bashrc

# Paste the following to run the script on demand
alias elec='sh /home/pi/powerpi/powerpi.sh'
```
