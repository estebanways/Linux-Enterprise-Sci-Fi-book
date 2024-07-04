#!/bin/sh
# Purges from the virtual mail boxes behind /var/vmail dir, the deleted
# mail, but not purged by users. Set this parameter in the option
# '-ctime +7 ', taht tells the deleted mail of the last 7 days is going to
# be completely deleted from the mail filesytem (local or remote,
# ,E.G remotely using NFS).
find /var/vmail/ -type f -ctime +7 -name '*,ST' -print0 |
xargs -r -0 rm -f
exit
