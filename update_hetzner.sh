local __TTL=600
local __RRTYPE

[ -z "$username" ] && write_log 14 "Service section not configured correctly! Missing subdomain as 'username'"
[ -z "$domain" ] && write_log 14 "Service section not configured correctly! Domain as 'domain'"
[ -z "$param_enc" ] && write_log 14 "Service section not configured correctly! Missing API Key as 'PARAMENC'"
[ -z "$param_opt" ] && write_log 14 "Service section not configured correctly! Missing opt as 'PARAMOPT'"
write_log 7 " show password $password"
[ $use_ipv6 -ne 0 ] && __RRTYPE="AAAA" || __RRTYPE="A"

curl -X "PUT" "https://dns.hetzner.com/api/v1/records/$username" \
     -H "Content-Type: application/json" \
     -H "Auth-API-Token: $param_enc" \
     -d $'{
  "value": "'$__IP'",
  "ttl": '$__TTL',
  "type": "'$__RRTYPE'",
  "name": "'$domain'",
  "zone_id": "'$param_opt'"
}' >$DATFILE

write_log 7 "hetzner answered: $(cat $DATFILE)"

return 0
