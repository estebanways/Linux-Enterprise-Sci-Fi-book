#!/bin/sh

# Generating new tripwire report file to /var/lib/tripwire/report/* including a
# date time stamp and the extension .twr to it.

tripwire --check 
# when active, next line can send reports via email to the users added in 
# the policy file twpol.txt
# tripwire --check --email-report

exit 0
