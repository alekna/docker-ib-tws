FROM alekna/openbox-desktop-vnc

RUN mkdir /root/Desktop; \
    curl -sO https://download2.interactivebrokers.com/installers/tws/latest/tws-latest-linux-x64.sh; \
    echo "/root/Jts" | sh /tws-latest-linux-x64.sh; \
    rm /tws-latest-linux-x64.sh
