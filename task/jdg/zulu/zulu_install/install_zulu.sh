#!/bin/bash


# install Azul RPM repo
rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems
curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo

# install Zulu JVM 
echo "Installing Zulu JVM $ZULU_JVM_VERSION"
yum -y install zulu-$ZULU_JVM_VERSION

# verify Zulu runs
zulu_java=`rpm -ql zulu-${ZULU_JVM_VERSION} |grep /bin/java$ | head -n 1`
$zulu_java -version


