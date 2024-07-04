!#/bin/sh
### BEGIN INIT INFO
# Provides: pen
# Required-Start: $local_fs $network
# Required-Stop: $local_fs
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: pen
# Description: pen load balancer and proxy daemon
### END INIT INFO
# Distribuites the workload between the servers in the cluster.
# -------------------------------------------------------------
# To Re-configure Pen in real time on the fly:
# A- Kill previous running Pen:
#ps -aux | grep pen
#kill <PID>
# B- Add a new Proxy rule:
#pen -r -a -d Load-balancer-IP:PORT> <cluster-host-1-IP:PORT> <cluster-host-n-IP:PORT> ...
# You can redirect from one port number in the loadbalancer to a another port number
# in the cluster ( high availability )host.
# C- To limit the max amount of connections:
# Here three servers cooperate in a web server farm. Host www1 runs its web server on
# port 8000 and accepts a maximum of 10 simultaneous connections. Host www2
# runs on port 80 and accepts 10 connections. Finally, www3 runs its web server on port
# 80 and allows an unlimited number of simultaneous connections.
#pen 80 www1:8000:10 www2:80:10 www3
# D- To block all the connections by running a new pen command in mode FOREFRONT:
#pen -r -a -d -f Load-balancer-IP:PORT> <cluster-host-1-IP:PORT> <cluster-host-n-IP:PORT> ...
# -------------------------------------------------------------
# System boot up rules:
# Update any changes on firewall scripts in the route like include
# bastion-server-firewall.sh
# Don't include port 22 which is for ssh because PEN will don't forward it.
# Anyway we need this ports not forwarded to access the load balancer
# through secure shell.
# Ports list:
# ntp: 123
# MySQL Cluster: 1186
# ftp: 21
# http (web): 80
# https (web): 443
# imap: 143
# imap3: 220
# imaps: 993
# pop2: 109
# pop3: 110
# pop3s: 995
# smtp: 25
# ssmtp: 465
# ...
pen -r -a 192.168.1.199:123 192.168.1.200:123 192.168.1.205:123
pen -r -a 192.168.1.199:1186 192.168.1.200:1186 192.168.1.205:1186
pen -r -a 192.168.1.199:21 192.168.1.200:21 192.168.1.205:21
pen -r -a 192.168.1.199:80 192.168.1.200:80 192.168.1.205:80
pen -r -a 192.168.1.199:443 192.168.1.200:443 192.168.1.205:443
pen -r -a 192.168.1.199:143 192.168.1.200:143 192.168.1.205:143
pen -r -a 192.168.1.199:220 192.168.1.200:220 192.168.1.205:220
pen -r -a 192.168.1.199:993 192.168.1.200:993 192.168.1.205:993
pen -r -a 192.168.1.199:109 192.168.1.200:109 192.168.1.205:109
pen -r -a 192.168.1.199:110 192.168.1.200:110 192.168.1.205:110
pen -r -a 192.168.1.199:995 192.168.1.200:995 192.168.1.205:995
pen -r -a 192.168.1.199:25 192.168.1.200:25 192.168.1.205:25
pen -r -a 192.168.1.199:465 192.168.1.200:465 192.168.1.205:465
#
#
# Once the balancers are up and running it's time to bind the virtual ip
# on the balancer's IP:
#sh /etc/init.d/pen-virtual-ip.sh
exit
