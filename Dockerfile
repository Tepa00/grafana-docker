FROM ubuntu:16.04
MAINTAINER Jesse Ikola <jesse.ikola@jubic.fi>

ENV GRAFANA_VERSION 3.1.1-1470047149

RUN apt-get update && \
  apt-get install -y curl gettext-base && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /workdir
RUN curl https://grafanarel.s3.amazonaws.com/builds/grafana-${GRAFANA_VERSION}.linux-x64.tar.gz >> /tmp/grafana.tar.gz
RUN tar -zxvf /tmp/grafana.tar.gz -C /workdir/
RUN mv /workdir/grafana* /workdir/grafana
ADD config/ /workdir/
ADD plugins/ /workdir/grafana/data/plugins/
ADD entrypoint.sh /workdir/entrypoint.sh
RUN chmod -R a+rwx /workdir/

# Replace files for custom graphics
ADD img/ /workdir/grafana/public/img/
ADD customize-styles.sh /workdir/
RUN /workdir/customize-styles.sh

ENTRYPOINT ["/workdir/entrypoint.sh"]
CMD ["/workdir/grafana/bin/grafana-server"]
