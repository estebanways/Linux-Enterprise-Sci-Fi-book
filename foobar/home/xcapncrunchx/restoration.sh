#!/bin/sh
# Name: restoration.sh
# (Adjust to your requirements)
# Execution: When system is destroyed after a new system installation or formatted,
# to be executed since the a Live distro DVD like Knoppix or floppy disc.
# or when we need to roll back changes on files.
# Machine: server, backup-server
# Allocation: /hd2
#
# To know exactly what directories are in the backup, read the script file backup.sh.
#
# Remember while the system is under restoration will not work, consider the clients and their
# processes.
#
# Create the filesystem's root in the second hd hd2 due to there the change is permanent
# and there is more space than in RAM or /swap:
mkdir /mnt/hd2/gentoo
# Mount the partitions you created during the system's installation or you have in your system
# to retore. Remember some like /swap /proc and /sys were not included during the
# backup process because the restoration process will not work. See the backup file
# backup.sh
cd /mnt/hd2
cd ..
# mount the HD1 in HD2 to be accessed from the Live System:
# Note the / directory is not in the backup but is mounted. Things that aren't partitions were
# not included as devices, they haven't them, but are under /, e.g. the dir /bin, etc.
# Changes can be made here depending on our needs and devices use our system.
mount /dev/hda1 /mnt/hd2/gentoo/
mount /dev/hda5 /mnt/hd2/gentoo/usr
mount /dev/hda6 /mnt/hd2/gentoo/var
mount /dev/hda8 /mnt/hd2/gentoo/tmp
mount /dev/hda9 /mnt/hd2/gentoo/home
# Paste the backup file dirs.tar.gz (or the renamed milestone) on the HD1 crashed mounted system,
# restoring it:
cd /mnt/hd2/gentoo
# Instead of 'cd' we would probably use the flag -C at the tar command's end followed by the path
# to the file, to define the path to it there where the files will be extracted.
tar -xvzpf /mnt/hd2/dirs.tgz
# Once the de-compress process finish, umount the filesystem to a avoid destroy their information:
# I will do it ten times un til the system's cron to unmount responds ;-)))
cd /
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
umount /dev/hda*
# Know the refreshed system is restored and prepared.
# Umount the second hard disk:
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
umount /dev/hdb1
#
exit
