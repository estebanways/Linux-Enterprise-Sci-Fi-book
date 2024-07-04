 
#!/bin/sh
# Name: backup.sh
# Execution: Automatically, every day, at 3:30 a.m,
# or Manually, whenever you need, after or before special (good,bad) events.
# Machine: server, backup-server
# Allocation: /home/esteban/
# (Adjust to your needs)
#
# Summary of some important directories:
# /home > user files, web files (for our installation, can be other like /var), etc. remember some.
# programs have users, like FTP.
# /var > databases, apache logs, etc.
# /usr > where “source” programs are installed, some program require creation of files and directories.
# /etc > configuration's files.
# /tmp > for post-morten analysis.
# /bin > executables of programs.
# Some system files:
# /dev > Do not include in the backup, the files of devices like hard discs, etc.
# /swap > Do not include in the backup, but can be necessary for post-morten analysis.
# /sys > Do not include in the backup, the restoration will not work.
# /proc > Do not include in the backup, the restoration will not work.
#
# When the backup is run manually during the day or at “working hours”, consider while
# the system is being rebooted, the client's services will not work.
#
# Creates the package, compress and paste the system
dirs the second hard disc:
# Some dirs are partitions, others are directories under /. We are using
# partitions for dirs /tmp, /usr, /var, /home.
cd /hd2
# Instead of 'cd' we would probably use the flag -C at the tar command's end followed by the path
# to the file, to define the path to it there. Every option begins with two of “-”, eg. - - exclude...:
tar -cvzpf /hd2/dirs.tgz –same-owner –exclude=/initrd/* --exclude=/hd2/* --exclude=/home/error.log --exclude=/proc/* --exclude= media/* --exclude=/dev/* --exclude=/mnt/* --exclude=/sys/* --exclude=/tmp/* / 2>/home/error.log
# tgz is the same to say .tar.gz, but MS windows readable extensions.
# Sends a copy of the backup to the backup-server:
# Edit your -p=PORT as ssh is listening
# The user before @ is the same user, configured in the server and the backup-server.
# Substitute the part of the line IP-or-FQDN by the server backup IP address.
# Next line is incomplete, to complete it if you need to sync see rsync scripts and modify it accordingly. If you don't do it the program only is going backup and will skip teh synchronization.
rsync -vv -e “ssh -p 49” /hd2/dirs.tar.gz esteban@IP-orFQDN:/home/esteban
# To create “milestones” (system restoration points or states) rename the backups before
# the backup is executed again. E.G.: 6660001-03-05-2010-8.2-dirs.tar.gz
#
# After the back is made run this to verify the new dirs.tar.gz file's integrity (in the server and in the backup server):
# sh> tar -tvzf /hd2/dirs.tgz 2>/home/error2.log
exit
