# logindetect-redhat
Logindetect is a simple script for any Redhat based Server that scans the /var/log/secure file for 3 different suspicous activities and places them in /var/logindetect.log but with the original line numbers for better readability. The first is any sudo or su activity in the log file, this is useful to take a look over everytime it happens. The second is any ssh sessions that are spawned on the host machine. Lastly is any admin session started between 12AM and 6AM and grabs the IP adress of the session starter. This script works very well with cron using ```crontab -e``` as root.

## Crontab
```0 6 * * * {DIRECTORYSTRUCTURE}/logindetect.sh```
This runs the script everyday at 6 AM for the admin to check once they start work. 
## Example 
<b> ./logindetect </b>

In /var/log/logindetect.log

> 42   Nov 22 00:35:13 cis245sr sshd[2273]: Accepted password for srosario from 192.168.152.1 port 5104 ssh2

> 43   Nov 22 00:35:13 cis245sr sshd[2273]: pam_unix(sshd:session): session opened for user admin by (uid=0)

> 49   Nov 22 00:39:54 cis245sr sshd[2273]: pam_unix(sshd:session): session closed for user admin
