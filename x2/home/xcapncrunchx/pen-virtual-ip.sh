!#/bin/sh
### BEGIN INIT INFO
# Provides:          dovecot
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: dovecot
# Description:       dovecot pop & imap daemon
### END INIT INFO
# Bind host ip addresses set in eth0 to create virtual IP address (192.168.1.197)
# Now try surfing to http://192.168.1.197/. One of the load balancers will be active
# and respond at that address. Disconnect that load balancer from the network to
# simulate a failure. Now the other load balancer will take over the address, 
# restoring functionality.
# In the example network, the firewall uses NAT, although that is in no way 
# necessary. A Cisco PIX would be configured something like this:
# static (inside,outside) 193.12.6.25 10.1.1.4 netmask 255.255.255.255 0 0
# conduit permit tcp host 193.12.6.25 eq 80 any
vrrpd -i eth0 -v 1 192.168.1.197

exit 1
