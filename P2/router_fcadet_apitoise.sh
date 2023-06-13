THIS=$(echo $HOSTNAME | tr -dc '0-9')
OTHER=$(if [ $THIS = "1" ]; then echo 2; else echo 1; fi;)

#start routing daemons
/usr/lib/frr/frrinit.sh start

#setup ip address 10.1.1.X on eth0 (connected to host)
ip addr add 10.1.1.$THIS/24 dev eth0

#create vxlan with ip address 20.1.1.X
ip link add name vxlan10 \
	type vxlan \
	id 10 \
	dev eth0 \
	remote 10.1.1.$OTHER \
	local 10.1.1.$THIS \
	dstport 4789
ip addr add 20.1.1.$THIS/24 dev vxlan10
ip link set dev vxlan10 up

#create a bridge from eth1 to vxlan
ip link add br0 type bridge
ip link set dev br0 up
brctl addif br0 eth1
brctl addif br0 vxlan10

tail -f /dev/null
