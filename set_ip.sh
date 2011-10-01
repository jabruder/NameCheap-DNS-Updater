#!/bin/bash


host_name="www"; #Change to match your hostname. Use @ to for the "naked" domain
domain="example.com"; #Change to match your domain name at NameCheap
password="password"; #Change to the password generated in the NameCheap dynamic DNS settings → http://namecheap.simplekb.com/kb.show/c/dynamicdns


# Looks up the public IP of the computer running the script
# Please follow the rules of whatismyip.com → http://www.whatismyip.com/faq/automation.asp

# We ask that automated files hit our site no more then once every five minutes or once every 300 seconds.
# We have a special automation page just for the purpose of helping programmers, you can find it here.
# If you need to use the automation page more often than this, contact us and we can work something out.
# You can reach us at automation at whatismyip dot com.

public_ip=`curl http://automation.whatismyip.com/n09230945.asp`


# Updates the hostname.domain.com with the IP address lookedup in the previous command
curl -s https://dynamicdns.park-your-domain.com/update?host="$host_name"\&domain="$domain"\&password="$password"\&ip="$public_ip";
