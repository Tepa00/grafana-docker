#!/bin/bash
envsubst < /workdir/defaults.ini > /workdir/grafana/conf/custom.ini
cd /workdir/grafana
exec "$@"

