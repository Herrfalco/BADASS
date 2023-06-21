echo "!
!
frr version 8.4_git
frr defaults traditional
hostname router_fcadet_apitoise-$LEAFNB
no ipv6 forwarding
!
!
interface eth0
ip address 10.1.1.1/24
exit
!
interface eth1
ip address 10.1.2.1/24
exit
!
interface eth2
ip address 10.1.3.1/24
exit
!
interface lo
ip address 4.4.4.4/32
exit
!
end" > /etc/frr/vtysh.conf

#start routing daemons
/usr/lib/frr/frrinit.sh start

tail -f /dev/null
