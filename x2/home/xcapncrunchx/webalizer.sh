#!/bin/sh
# Updates the web sites visitors stats for webalizer, based in the site 
# log file in /var/log/apache2/site-name.
# This file have to be added to a cron job in the crontab or pasted in the
# directory /etc/cron.hourly.

# Adds to the /home/user-name/tmp/webalizer/ dir the updated static stats info.
# For every hosting site (user) listed. Check users against the correspondent
# apache "default" site's file.


# domain: aestudio.sytes.net
cd /home/aestudio/tmp/webalizer
/usr/bin/webalizer -q

# domain: cronos.sytes.net
#cd /home/web2/tmp/webalizer
#/usr/bin/webalizer -q

# domain: etribe.sytes.net
cd /home/etribe/tmp/webalizer
/usr/bin/webalizer -q

# domain: hereisthedeal.hopto.org
cd /home/hereisthedeal/tmp/webalizer
/usr/bin/webalizer -q

