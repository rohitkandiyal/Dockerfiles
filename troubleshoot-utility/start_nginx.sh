#!/bin/sh

tech_name=$1
#echo $tech_name

NGINX_FILE="/usr/share/nginx/html/rohit/index.html"
sed -i "s/%%DOCKER_COMMAND%%/${tech_name}/g" "${NGINX_FILE}"

if [[ -e /etc/podinfo/podname ]]; then
  podname=`cat /etc/podinfo/podname`
else
  podname="SeemsDownwardAPIFailedForpodname"
fi


## commented below as getting nodename via downwardapi as volume fails with below error
## HENCE using as env var
#
#if [[ -e /etc/podinfo/nodename ]]; then
#  nodename=`cat /etc/podinfo/nodename`
#else
#  nodename="SeemsDownwardAPIFailedFornodename"
#fi

sed -i "s/%%POD_NAME%%/${podname}/g" "${NGINX_FILE}"
sed -i "s/%%NODE_NAME%%/${MY_NODE_NAME}/g" "${NGINX_FILE}"

sed -i "s/%%USER_NAME%%/${username}/g" "${NGINX_FILE}"


if [[ -e /etc/foo/password ]]; then
  passwd=`cat /etc/foo/password`
else
  passwd="SeemsSecretPasswordfailed"
fi

sed -i "s/%%PASSWORD%%/${passwd}/g" "${NGINX_FILE}"

nginx -g "daemon off;"
