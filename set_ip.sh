#!/bin/bash


host_name="subdomain"; #Change to match your hostname. Use @ to for the "naked" domain
domain="domain.com"; #Change to match your domain name at NameCheap
password="Password"; #Change to the password generated in the NameCheap dynamic DNS settings → http://namecheap.simplekb.com/kb.show/c/dynamicdns


# Looks up the public IP of the computer running the script

public_ip=`curl checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`


# Updates the hostname.domain.com with the IP address lookedup in the previous command
curlcmd=`curl -s https://dynamicdns.park-your-domain.com/update?host="$host_name"\&domain="$domain"\&password="$password"\&ip="$public_ip" | /usr/bin/grep "<ErrCount>0</ErrCount>"`
# The previous is all one line... It will add the output of the curl command to the variable $curlcmd only if it contains a passing error count.

if [ ! "$curlcmd" ] ; then
  # If the variable $curlcmd is empty (failed) do stuff...
  curl -s \
  -F "token=App Token" \
  -F "user=User ID" \
  -F "message=DNS Updater Failure" \
  https://api.pushover.net/1/messages.json
  exit 1
fi