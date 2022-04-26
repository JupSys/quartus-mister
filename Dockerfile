FROM debian:stretch

RUN apt-get update && apt-get -y install expect locales wget libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# install quartus prime
RUN mkdir -p /root/quartus && \
    cd /root/quartus && \
    wget -q https://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar && \
    tar xvf Quartus-lite-17.0.2.602-linux.tar && rm Quartus-lite-17.0.2.602-linux.tar

# adding scripts
ADD files/ /

RUN cd /root/quartus && /root/setup 17.0 && rm -rf /root/quartus && rm -rf /root/setup*

ENV LD_PRELOAD /usr/lib/libtcmalloc_minimal.so.4:/usr/lib/x86_64-linux-gnu/libstdc++.so.6
