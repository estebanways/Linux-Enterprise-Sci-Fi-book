!#/bin/sh


# DANGER!: 
# > Do not use this script at system startup (as a rc service).
# > You always must safely shutdown after the system login, 
#   before you do anything else like re-add data-node 
#   to the cluster, etc. Otherwise the server will delete the tables, 
#   i.e.: (for table simples) simples.frm and simples.ndb under
#   /var/lib/mysql/clusterdb/ and your ndb-cluster databases will be lost.


# MySQL Cluster procedure.



# Use 'whereis + command' to find out the command executable location;


# 1. Check system health:

# 1.1 Check memory resources:

#swapon -s
#free
#ps -aux
#ps -aux | less
#top  (check processes of ndbd [1 per data node], ndb_mgmt and mysql
#df -h


# 1.2 Check services statuses:

#/etc/init.d/mysql status
# If you don't want to stop the service don't use next command, use 
# management node status:
# /etc/init.d/mysql-ndb-mgm stop
# management node status:
#ndb_mgm -e show


# 2. Check logs and data directories:

# Command to check log files:
#less +F ndb_*.log
# To close the file use keys: CTRL + C and then press 'q' (quit).

# 2.1:

# 2.1.1: Directory defined in /etc/mysql/ndb_mgmd.cnf:

# datadir=/home/my_cluster/ndb_data

# 2.1.2: Directories where mysql-cluster sends the files if datadir option
# is not set:

# /
# /etc./init.d
# /etc/mysql/*
# /root
# /home/user_directory


# Example: List of Files and directories:


# CONFIG FILES:

# conf.d/            
# config.ini         
# debian.cnf         
# debian-start*     
# my.cnf             
# my.cnfBAK          
# my.cnfBAK2
        

# NODE 1 (MGMT):

# ndb_1_cluster.log  (*)
# ndb_1_out.log      
# ndb_1.pid


# NODE 3 (DATA NODE):

# ndb_3_error.log    (*)
# ndb_3_fs/          (data files)
# ndb_3_out.log      (*)
# ndb_3.pid	   (*)

# (1 more every reboot without safely shutdown):

# ndb_3_trace.log.1     
# ndb_3_trace.log.2     
# ndb_3_trace.log.3     
# ndb_3_trace.log.4     
# ndb_3_trace.log.5     
# ndb_3_trace.log.6     
# ndb_3_trace.log.next


# NODE 4 (DATA NODE):

# ndb_4_error.log       (*)
# ndb_4_fs/             (data files)
# ndb_4_out.log         (*)
# ndb_4.pid	      (*)

# (1 more every reboot without safely shutdown):
        
# ndb_4_trace.log.1
# ndb_4_trace.log.2
# ndb_4_trace.log.3
# ndb_4_trace.log.4
# ndb_4_trace.log.5
# ndb_4_trace.log.6
# ndb_4_trace.log.next

# ndb_pid3425_error.log
# ndb_pid3604_error.log
# ndb_pid3606_error.log
# ndb_pid3619_error.log
# ndb_pid3620_error.log
# ndb_pid4254_error.log



# 2.2 Mysql logs:
# /var/log/mysql/*
# /var/log/mysql.log



# 3. Check mysql databases directories:

# /var/lib/mysql
# /var/lib/mysql-cluster




# 4. Safely shutdown:

# 4.0: Back up the files db.opt  simples.frm  simples.ndb,
# allocated under /var/lib/mysql/ndb-cluster-database_names or the complete
# directory /var/lib/mysql/*, including non mysql-cluster databases.


# 4.1 The Debian way (use this!):


#/etc/init.d/mysql status  (check status)
#/etc/init.d/mysql stop
#ndb_mgm -e show	   (check status)
#/etc/init.d/mysql-ndb-mgm stop


# 4.2 Using mysql commands (mysql official documentation):

#/usr/bin/mysqladmin -u root2 -pPASSWORDSTRINGHERE -h 127.0.0.1 shutdown
# Or with password prompt:
#/usr/bin/mysqladmin -u root2 -p -h 127.0.0.1 shutdown
#/usr/bin/ndb_mgm -e shutdown



# 5. Restart mysql cluster including new data nodes:


# 5.1 The Debian way (see sections 4.1 and 2.1. Use this!):

#/etc/init.d/mysql start
#/etc/init.d/mysql-ndb-mgm start

# Run this script data-nodes-start-up.sh to up the data nodes
# or run next nd-cluster command once per node in the file 
# /etc/mysql/ndb_mgmd.cnf (Please add more data nodes to complete the 
# existent amount):
/usr/sbin/ndbd -c localhost:1186
echo "Data node 3 seems to be up"
/usr/sbin/ndbd -c localhost:1186
echo "Data node 4 seems to be up"



# 5.2 Using mysql commands (mysql official documentation):

# (DANGER: The logfile group is created when the data nodes are started 
# with --initial. Starting that data node with --initial causes all files
# in the directory to be deleted!). --initial is not working with 
# next command (with debian binaries from apt sources) why?. If I use
# the command, the files will appear where the file (declared with
# the argument -f) is (see section 2.3 and choose option 5.1): 
#/usr/sbin/ndb_mgmd -f /etc/mysql/ndb_mgmd.cnf
# Add one line per data-node in the file /etc/mysql/ndb_mgmd.cnf
#/usr/sbin/ndbd -c localhost:1186
#echo "Data node 3 seems to be up"
#/usr/sbin/ndbd -c localhost:1186
#echo "Data node 4 seems to be up"



# Restart mysql service:

#/etc/init.d/mysql stop
#/etc/init.d/mysql start
# or use:
#/etc/init.d/mysql restart



# 6. Check nodes show (and are) up:

#/usr/bin/ndb_mgm -e show
# or use the CLI (interface):
#ndb_mgm
#ndb_mgm> show
# To exit the CLI:
#ndb_mgm> exit


# The output will show data nodes are connected, for example:

# Connected to Management Server at: localhost:1186
# Cluster Configuration
# ---------------------
# [ndbd(NDB)] 2 node(s)
# id=3 @127.0.0.1 (mysql-5.5.19 ndb-7.2.4, Nodegroup: 0, Master)
# id=4 @127.0.0.1 (mysql-5.5.19 ndb-7.2.4, Nodegroup: 0)
# [ndb_mgmd(MGM)] 1 node(s)
# id=1 @127.0.0.1 (mysql-5.5.19 ndb-7.2.4)
# [mysqld(API)] 1 node(s)
# id=50 (not connected, accepting connect from any host)


# Sometimes mysql nodes appear as not connected but I you go to check
# the new database with mysql, the manager will say to mysqld
# "go and connect you!"


# 7. If the nodes are still down, restart this procedure from sections
# "1. Check system health:" or "4.Safely shutdown:", depending on 
# the issue.


# 8. Check existent databases with phpmyadmin and Workbench.


# 9. Create a test database:


#mysql -h 127.0.0.1 -u root2 -p
# Type password for mysql new user root2
# We are in the mysql CLI:
#mysql> create database clusterdb;use clusterdb;
#mysql> create table simples (id int not null primary key) engine=ndb;
# Note: All the ndbcluster tables need ID field)
#mysql> insert into simples values (1),(2),(3),(4);
#mysql> select * from simples;
# Type 'exit' or 'quit' to return to the shell.


# See new db under /var/lib/mysql
# Check phmyadmin access to new db and table.
# Check you can edit the table using Workbench.



# 10. Reboot the system.

# Check the Virtual machine output is ok during startup.


# 11. Start mysql cluster according to section "5. Restart mysql
# cluster including new data nodes:".

# Run management node status:
# ndb_mgm -e show


# 12. Confirm everything is going as expected:

# Check again the new databases are OK. Check one db and one ndb-cluster
# database at least.


exit 0
