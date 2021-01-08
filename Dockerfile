FROM alekna/openbox-desktop-vnc
RUN apt-get update; \
    apt-get install -y chromium; \
    apt-get clean
RUN mkdir /root/Desktop; \
    curl -sO https://download2.interactivebrokers.com/installers/tws/beta/tws-beta-linux-x64.sh; \
    echo "/root/Jts" | sh /tws-beta-linux-x64.sh; \
    rm /tws-beta-linux-x64.sh
