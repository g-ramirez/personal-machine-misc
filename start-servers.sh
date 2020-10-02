#!/bin/zsh

_OS_PARAMS=$(env | awk 'BEGIN {FS="="} /^OS_/ {print $1;}' | paste -sd ' ')
for param in $_OS_PARAMS; do
    unset $param
done
unset _OS_PARAMS

export OS_AUTH_URL=http://10.230.19.53:5000/v3
export OS_PROJECT_NAME=gabriel1109
export OS_PROJECT_DOMAIN_NAME=user_domain
export OS_USER_DOMAIN_NAME=user_domain
export OS_USERNAME=gabriel1109
export OS_PASSWORD=<pass>
export OS_REGION_NAME=stsstack
export OS_IDENTITY_API_VERSION=3
export OS_AUTH_VERSION=3

for server in $(openstack server list --status SHUTOFF -c Name -f value|grep -v bastion); do openstack server start $server; done;
openstack server start bastion-backup
