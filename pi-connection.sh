#! /bin/sh

login='mgts'
pass=__PASS__ # yeah, I know about SSH keys
router_ip='192.168.1.254'
pi_name="t-rex"
pi_user="pi3"


OUTPUT=$(./pi-router-raw.exp $router_ip $login $pass)
pi_ip=$(echo "$OUTPUT" | grep "$pi_name" | grep -o "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*")

echo ''Got "$pi_name"\'s ip: "$pi_ip"''
echo "Connecting to Pi..."

ssh "$pi_user"@"$pi_ip"
