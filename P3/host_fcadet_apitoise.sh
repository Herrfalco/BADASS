HOSTNB=$(echo $HOSTNAME | tr -dc '0-9')
DEVNB=$(if [ "$HOSTNB" = "1" ]; then echo 1; else echo 0)

#setup ip address
ip addr add 30.1.1.$HOSTNB/24 dev eth$DEVNB

tail -f /dev/null
