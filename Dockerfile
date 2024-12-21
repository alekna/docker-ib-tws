FROM alekna/openbox-desktop-vnc

RUN apt-get update; \
    apt-get install -y chromium; \
    apt-get clean

RUN mkdir /root/Desktop

RUN curl -sO https://download2.interactivebrokers.com/installers/tws/stable/tws-stable-linux-x64.sh; \
    echo "/root/Jts" | sh /tws-stable-linux-x64.sh; \
    rm /tws-stable-linux-x64.sh

RUN curl -sO https://download2.interactivebrokers.com/installers/ibgateway/stable-standalone/ibgateway-stable-standalone-linux-x64.sh; \
    echo "/root/Jts/ibgateway" | sh /ibgateway-stable-standalone-linux-x64.sh; \
    rm /ibgateway-stable-standalone-linux-x64.sh
