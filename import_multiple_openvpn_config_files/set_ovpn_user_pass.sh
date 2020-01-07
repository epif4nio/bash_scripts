#!/bin/bash

# Changes password-flags from 1 to 0
sed -i 's/password-flags=1/password-flags=0/g' $1

# Adds in a username entry after tunnel-mtu
sed -i '/tunnel-mtu=1500/a username=<enter your username here>' $1

# Adds your password in clear text (danger!) at the end of the file
echo >> $1
echo [vpn-secrets] >> $1
echo password='<enter your password here>' >> $1

