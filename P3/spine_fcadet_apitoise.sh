#start routing daemons
/usr/lib/frr/frrinit.sh start

CONFIG="!
!
frr version 8.4_git
frr defaults traditional
hostname router_fcadet_apitoise-$LEAFNB
no ipv6 forwarding
!
!
interface eth0
ip address 10.1.2.1/24
exit
!
interface eth1
ip address 10.1.3.1/24
exit
!
interface eth2
ip address 10.1.4.1/24
exit
!
interface lo
ip address 1.1.1.1/32
exit
!
end"

echo "$CONFIG" | vtysh

tail -f /dev/null
