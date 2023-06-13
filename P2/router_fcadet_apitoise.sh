THIS=$(echo $HOSTNAME | tr -dc '0-9')
OTHER=$(if [ $THIS = "1" ]; then echo 2; else echo 1; fi;)

#setup ip address 10... of interface connected to host
ip addr add 10.1.1.$THIS/24 dev eth0

#create vxlan with id 10 through ip address 20...
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

#start routing daemons
/usr/lib/frr/frrinit.sh start

tail -f /dev/null
