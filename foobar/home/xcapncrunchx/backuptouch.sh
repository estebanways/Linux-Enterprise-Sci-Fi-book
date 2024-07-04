#!/bin/sh
# Name: backuptouch.sh
# Execution: Automatically, every day, at 3 a.m.
# or before system changes.
# Machine: server, backup-server
# Allocation: /home/esteban/
#
# Forces the filesystems (partitions) check at startup:
touch /forcefsck
# Reboot the machine
reboot
exit
#
