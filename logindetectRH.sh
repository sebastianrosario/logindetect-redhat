#!/bin/bash
# Searches auth.log for sudo sessions, ssh logins between 12AM and 6AM, and admin logins
awk '/sud?o?:session/ {print NR," ",$0}' /var/log/secure >> /var/log/logindetect.log
echo -e "\n"
awk '/sshd/ {if($3 < "06"){print NR," ",$0}}' /var/log/secure >> /var/log/logindetect.log
echo -e "\n"
awk '/admin.$/ {print NR," ",$0}' /var/log/secure >> /var/log/logindetect.log
echo -e "\n"
