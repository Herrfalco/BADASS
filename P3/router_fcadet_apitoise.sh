ROUTNB=$(echo $HOSTNAME | tr -dc '0-9')
DEVNB=$(if [ "$ROUTNB" = "2" ]; then echo 1; else echo 0; fi;)

#create vxlan
ip link add name vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up

#bridge vxlan to VTEP interface
ip link add br0 type bridge
ip link set dev br0 up
brctl addif br0 eth$DEVNB
brctl addif br0 vxlan10

#start routing daemons
/usr/lib/frr/frrinit.sh start

tail -f /dev/null
