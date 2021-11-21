# hetzneropenwrtddns
Update your domain via Openwrt using Hetzner Api
## Prerequirements
1. Create an Hetzner DNS-ACCOUNT (dns.hetzner.com)
2. Create your dns zone and your records 
3. create an pi key (https://dns.hetzner.com/settings/api-token)
4. Find out your zone-id, and your record id by running: 
  curl "https://dns.hetzner.com/api/v1/records?zone_id={ZoneID}" \
     -H 'Auth-API-Token: LlGoDUQ39S6akqoav5meAsv5OIpeywhj'
     ZoneID is your domain name.
5. Copy the update_hetzner.sh script to /etc/ddns/ on your openwrt router
6. edit your /etc/config/ddns and add:
ipv6:
config service 'hetznerv6'
        option use_ipv6 '1'
        option enabled '1'
        option lookup_host 'DYN.YOURDOMAIN.COM'
        option update_script '/etc/ddns/update_hetzner.sh'
        option domain 'YOUR ZONE NAME (for example dyn)'
        option username 'YOURRECORDID'
        option password 'noneedtochange'
        option param_enc 'YOURAPITOKEN'
        option param_opt 'YOUR ZONEID'
        option ip_source 'network'
        option use_syslog '2'
        option check_unit 'minutes'
        option force_unit 'minutes'
        option retry_unit 'seconds'
        option ip_network 'wan6'
        option interface 'wan6'
ipv4:
config service 'hetznerv4'
        option use_ipv6 '0'
        option enabled '1'
        option lookup_host 'DYN.YOURDOMAIN.COM'
        option update_script '/etc/ddns/update_hetzner.sh'
        option domain 'YOUR ZONE NAME (for example dyn)'
        option username 'YOURRECORDID'
        option password 'noneedtochange'
        option param_enc 'YOURAPITOKEN'
        option param_opt 'YOUR ZONEID'
        option ip_source 'network'
        option use_syslog '2'
        option check_unit 'minutes'
        option force_unit 'minutes'
        option retry_unit 'seconds'
        option ip_network 'wan'
        option interface 'wan'
You should now have a working dyndns
