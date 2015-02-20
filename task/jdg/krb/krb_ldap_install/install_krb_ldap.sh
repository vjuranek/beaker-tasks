#!/bin/bash

# kernel param are passed via Beaker recipe, using recipe kernel_options_post

KEYTAB_URL=$1 

echo "Installing Kerberos and LDAP tools."
echo "Also downloading keytabs from $KEYTAB_URL"

wget --no-check-certificate $KEYTAB_URL/host_eapserver_DC2008.keytab
wget --no-check-certificate $KEYTAB_URL/host_eapserver_DC2012.keytab
wget --no-check-certificate $KEYTAB_URL/host_jdgserver_DC2008.keytab
wget --no-check-certificate $KEYTAB_URL/host_jgdserver_DC2012.keytab

mkdir ~/keytabs
mv *.keytab ~/keytabs

# install Kerberos and LDAP tools
yum -y install krb5-workstation cyrus-sasl-gssapi openldap-clients
# setup kerberos
cp krb5.conf /etc/krb5.conf
