#!/bin/bash

if [ -z $LDAP_ENABLED ]; then
  LDAP_ENABLED=false
  echo "Set LDAP var to false"
fi

echo "Substituting grafa conf with environment variables"
envsubst < /workdir/defaults.ini > /workdir/grafana/conf/custom.ini
echo "Configuring LDAP"
envsubst < /workdir/ldap.toml > /workdir/grafana/conf/ldap.toml

cd /workdir/grafana
exec "$@"

