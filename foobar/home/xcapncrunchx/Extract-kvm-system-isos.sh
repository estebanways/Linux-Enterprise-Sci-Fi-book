# Extract virtual Machines:
# (Adapt to your requirements)
cd /
cp -dpR /hd2/servers-x1/X1-001-03-29-14-AFTER-HOSTNAME+FQDN.tgz ./
cp -dpR /hd2/servers-x1/X1-001-03-29-14-AFTER-HOSTNAME+FQDN-SETUP.tgz ./
cp -dpR /hd2/servers-x1/X2-001-03-29-14-AFTER-HOSTNAME+FQDN.tgz ./
cp -dpR /hd2/servers-x1/X2-001-03-29-14-AFTER-HOSTNAME+FQDN-SETUP.tgz ./
tar xvzf X1-001-03-29-14-AFTER-HOSTNAME+FQDN.tgz
tar xvzf X1-001-03-29-14-AFTER-HOSTNAME+FQDN-SETUP.tgz
tar xvzf X2-001-03-29-14-AFTER-HOSTNAME+FQDN.tgz
tar xvzf X2-001-03-29-14-AFTER-HOSTNAME+FQDN-SETUP.tgz
exit
