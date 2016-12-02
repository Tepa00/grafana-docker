#!/bin/bash
find /workdir/grafana/public/ -type f -print0 | xargs -0 sed -i 's/#dF7518/#004e59/g'
find /workdir/grafana/public/ -type f -print0 | xargs -0 sed -i 's/#e37d24/#02818a/g'
find /workdir/grafana/public/ -type f -print0 | xargs -0 sed -i 's/#e98a36/#02818a/g'

find /workdir/grafana/public/ -type f -print0 | xargs -0 sed -i 's/255,213,0,0.7/2,129,138,1/g'
find /workdir/grafana/public/ -type f -print0 | xargs -0 sed -i 's/255,68,0,0.7/152,197,215,1/g'

find /workdir/grafana/public/ -type f -print0 | xargs -0 sed -i 's/255,213,0,.7/2,129,138,1/g'
find /workdir/grafana/public/ -type f -print0 | xargs -0 sed -i 's/255,68,0,.7/152,197,215,1/g'
