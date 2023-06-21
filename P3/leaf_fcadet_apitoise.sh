LEAFNB=$(echo $HOSTNAME | tr -dc '0-9')

#create vxlan
ip link add name vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up

#bridge vxlan to VTEP interface
ip link add br0 type bridge
ip link set dev br0 up
brctl addif br0 eth0
brctl addif br0 vxlan10

echo "!
!
frr version 8.4_git
frr defaults traditional
hostname $HOSTNAME
no ipv6 forwarding
!
interface eth1
ip address 10.1.$LEAFNB.2/24
ip ospf area 0
exit
!
interface lo
ip address $LEAFNB.$LEAFNB.$LEAFNB.$LEAFNB/32
ip ospf area 0
exit
!
end" > /etc/frr/vtysh.conf

#start routing daemons
/usr/lib/frr/frrinit.sh start

tail -f /dev/null
