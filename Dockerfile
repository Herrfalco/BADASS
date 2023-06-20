######################################## HOST ###############################################
FROM alpine AS host

ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P1/host_fcadet_apitoise.sh /P1.sh
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P2/host_fcadet_apitoise.sh /P2.sh
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P3/host_fcadet_apitoise.sh /P3.sh

####################################### ROUTER ##############################################

FROM frrouting/frr AS router

ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/Utils/daemons.conf /etc/frr/daemons
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P1/router_fcadet_apitoise.sh /P1.sh
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P2/router_fcadet_apitoise.sh /P2.sh
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P3/spine_fcadet_apitoise.sh /P3_spine.sh
ADD https://raw.githubusercontent.com/Herrfalco/BADASS/main/P3/leaf_fcadet_apitoise.sh /P3_leaf.sh

#############################################################################################
