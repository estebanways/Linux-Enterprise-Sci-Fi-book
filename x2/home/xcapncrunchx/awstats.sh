#!/bin/sh
# Updates the web sites visitors stats, based in the site log file in /var/log/apache2/site-name.

# Perl script + Site config file list (/etc/awstats, no awstats preffix 
# no conf suffix)
/usr/lib/cgi-bin/awstats.pl -config=aestudio
# /usr/lib/cgi-bin/awstats.pl -config=cronos.sytes.net
/usr/lib/cgi-bin/awstats.pl -config=etribe
/usr/lib/cgi-bin/awstats.pl -config=hereisthedeal

# Add new sites here


# Updates static stats in the tmp/awstats dir of every site,
# like /home/aestudio/tmp/awstats/*

# Update on 2/22/2012: After the processors speed and load review, decided to comment the next static pages perl scripts:

#/usr/share/doc/awstats/examples/awstats_buildstaticpages.pl -update -config=aestudio -dir=/home/aestudio/tmp/awstats/ -awstatsprog=/usr/lib/cgi-bin/awstats.pl

# /usr/share/doc/awstats/examples/awstats_buildstaticpages.pl -update -config=cronos.sytes.net -dir=/home/web2/tmp/awstats/ -awstatsprog=/usr/lib/cgi-bin/awstats.pl

# /usr/share/doc/awstats/examples/awstats_buildstaticpages.pl -update -config=etribe -dir=/home/etribe/tmp/awstats/ -awstatsprog=/usr/lib/cgi-bin/awstats.pl

# /usr/share/doc/awstats/examples/awstats_buildstaticpages.pl -update -config=hereisthedeal -dir=/home/hereisthedeal/tmp/awstats/ -awstatsprog=/usr/lib/cgi-bin/awstats.pl
