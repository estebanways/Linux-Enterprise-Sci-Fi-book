!#/bin/sh
# Script to update 1 file like configuration file under /etc/ on many hosts
# at once. Add a row per host you want to update to (remote destiny).
# BEFORE RUN THE SCRIPT Ensure you that:
# 1. You run the script from the host which has the latest copy of the file
# you are synchronizing from (source)
# 2. The lines for hosts not to update were commented out or have been removed
# include the localhost.
# 3. Verify the file permissions are the correct before and after the propagation.
# Note: use rsync (update) or scp (overwrite) to make the tunnel to send the
# file update through it.
# Include restart/reload services or reboot commands if it is required.
pass="PLAIN-ROOT_PASS-HERE-PLS"
rsync -avv --rsh="sshpass -p $pass ssh" /var/log/apache2/ x1:/var/log/apache2/
#rsync -avv --rsh="sshpass -p $pass ssh" /etc/init.d/bastion-server-firewall.sh x1:/etc/init.d/bastion-server-firewall.sh
#rsync -avv --rsh="sshpass -p $pass ssh" /etc/init.d/bastion-server-firewall.sh x2:/etc/init.d/bastion-server-firewall.sh
#rsync -avv --rsh="sshpass -p $pass ssh" /etc/init.d/bastion-server-firewall.sh x3:/etc/init.d/bastion-server-firewall.sh
#rsync -avv --rsh="sshpass -p $pass ssh" /etc/init.d/bastion-server-firewall.sh x3:/etc/init.d/bastion-server-firewall.sh
#rsync -avv --rsh="sshpass -p $pass ssh" /etc/init.d/bastion-server-firewall.sh y1:/etc/init.d/bastion-server-firewall.sh
#rsync -avv --rsh="sshpass -p $pass ssh" /etc/init.d/bastion-server-firewall.sh y2:/etc/init.d/bastion-server-firewall.sh
