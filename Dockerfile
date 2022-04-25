FROM debian:bullseye

RUN apt-get update && apt-get -y install expect locales wget libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# install quartus prime
RUN mkdir -p /root/quartus && \
    cd /root/quartus && \
    wget -q http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar && \
    tar xvf Quartus-lite-17.0.0.595-linux.tar && rm Quartus-lite-17.0.0.595-linux.tar

# adding scripts
ADD files/ /

RUN cd /root/quartus && /root/setup 17.0 && rm -rf /root/quartus && rm -rf /root/setup*
