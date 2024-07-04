# Compress kvm hosts images:
# (Adapt to your requirements)
tar -cvzpf /hd2/x1.tgz 2>/hd2/error-x1.log /var/lib/libvirt/images/x1.qcow2
tar -cvzpf /hd2/x1-config.tgz 2>/hd2/error-x1-config.log /var/lib/libvirt/qemu/x1.xml
tar -cvzpf /hd2/x2.tgz 2>/hd2/error-x2.log /var/lib/libvirt/images/x2.qcow2
tar -cvzpf /hd2/x2-config.tgz 2>/hd2/error-x2-config.log /var/lib/libvirt/qemu/x2.xml
# And then give a name to the servers backups:
# X1-001-03-29-14-AFTER-HOSTNAME+FQDN.tgz
# X1-001-03-29-14-AFTER-HOSTNAME+FQDN-SETUP.tgz
# X2-001-03-29-14-AFTER-HOSTNAME+FQDN.tgz
# X2-001-03-29-14-AFTER-HOSTNAME+FQDN-SETUP.tgz
exit
