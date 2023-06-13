######################################## HOST ###############################################
FROM alpine AS host
RUN apk update && apk upgrade

ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P1/host_fcadet_apitoise.sh /P1.sh
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P2/host_fcadet_apitoise.sh /P2.sh

####################################### ROUTER ##############################################

FROM frrouting/frr AS router
RUN apk update && apk upgrade

ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/Utils/daemons.conf /etc/frr/daemons
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P1/router_fcadet_apitoise.sh /P1.sh

#############################################################################################

#ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/Utils/vtysh.conf /etc/frr/vtysh.conf

#ENTRYPOINT /usr/lib/frr/frrinit.sh start && tail -f /dev/null

# For P2

#COPY utils/ip_config.sh ip_config.sh
#COPY utils/P3_ip_conf.sh P3_ip_conf.sh

#COPY utils/static_vxlan.sh static_vxlan.sh
#COPY utils/dyn_vxlan.sh dyn_vxlan.sh

# For P3

#COPY utils/rr_conf.sh rr_conf.sh
#COPY utils/leaf_conf.sh leaf_conf.sh

# Start Project
