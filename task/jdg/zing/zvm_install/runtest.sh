#!/bin/sh

# A sript which does some admin stuff and run the actual task
# Author: vjuranek

# Include rhts environment. 
. /usr/bin/rhts-environment.sh
. /usr/lib/beakerlib/beakerlib.sh

# root passwd is not available and cannot be setup, so hardcoded one here
# see RT #180512 for more details
echo "root:redhat" | chpasswd

chmod a+x ./install_zvm.sh
rhts-run-simple-test "Zing_ZMV_install" "./install_zvm.sh $DOWNLOAD_URL $ZING_TOOLS_RPM $ZING_ZVM_RPM $ZING_LICENSE_RPM"
