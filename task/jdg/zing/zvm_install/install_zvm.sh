#!/bin/bash

# kernel param are passed via Beaker recipe, using recipe kernel_options_post

DOWNLOAD_URL=$1 
ZING_TOOLS_RPM=$2
ZING_ZVM_RPM=$3
ZING_LICENSE_RPM=$4

echo "Installing Zing ZVM"
echo "Using following parameters:"
echo "  * download URL: $DOWNLOAD_URL"
echo "  * Zing tools RPM: $ZING_TOOLS_RPM"
echo "  * Zing ZVM RPM: $ZING_ZVM_RPM"
if [ "x$ZING_LICENSE_RPM" != "x" ]; then 
    echo "  * Zing license daemon RPM: $ZING_LICENSE_RPM"
fi

wget --no-check-certificate $DOWNLOAD_URL/$ZING_TOOLS_RPM
wget --no-check-certificate $DOWNLOAD_URL/$ZING_ZVM_RPM
wget --no-check-certificate $DOWNLOAD_URL/license.txt

# install Zinf system tools
yum -y install --nogpgcheck $ZING_TOOLS_RPM
#system-config-zing-memory
cp pmem.conf /etc/zing/pmem.conf
service zing-memory restart
ulimit -v unlimited -m unlimited -c unlimited

# install ZVM
yum -y install --nogpgcheck $ZING_ZVM_RPM

# set up license and install license daemon if ZING_LICENSE_RPM is setup
# license daemon is needed in case of ZVM 1.6, in 1.7 is part of Zing system tools RPM
cp license.txt /etc/zing/
if [ "x$ZING_LICENSE_RPM" != "x" ]; then 
    wget --no-check-certificate $DOWNLOAD_URL/$ZING_LICENSE_RPM
    yum -y install --nogpgcheck $ZING_LICENSE_RPM
fi

# verify ZMV runs
zvm_java=`rpm -qlp ${ZING_ZVM_RPM} |grep /bin/java$ | head -n 1`
$zvm_java -version
