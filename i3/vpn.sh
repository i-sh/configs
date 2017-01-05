#!/bin/bash -e

result=$(nmcli -t -f name,type,state con | egrep "(vpn):включено" | awk -F':' '{ print $1 }')
[[ -z $result ]] && echo -e "VPN: down\nVPN: down\n#FF0000\n" || echo -e "VPN: $result\nVPN: $result\n#00FF00\n"
