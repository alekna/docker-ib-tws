FROM alekna/openbox-desktop-vnc

ENV IBC_VERSION=3.20.0
ENV PATH="/root/.cargo/bin:${PATH}"

# 1. System packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    curl \
    git \
    xterm \
    openssh-client \
    ca-certificates \
    wget \
    unzip \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/Desktop

# 2. Rust installation
RUN rm -rf /root/.rustup /root/.cargo && \
    curl -fsSL https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain stable

# 3. Install IBC
RUN mkdir -p /opt/ibc && \
    wget -q https://github.com/IbcAlpha/IBC/releases/download/${IBC_VERSION}/IBCLinux-${IBC_VERSION}.zip -O /tmp/ibc.zip && \
    unzip -o /tmp/ibc.zip -d /opt/ibc && \
    chmod -R +x /opt/ibc && \
    rm /tmp/ibc.zip

# 4. Install TWS
RUN wget -q https://download2.interactivebrokers.com/installers/tws/stable/tws-stable-linux-x64.sh -O /tmp/tws-installer.sh && \
    sh /tmp/tws-installer.sh -q -dir /root/Jts && \
    rm /tmp/tws-installer.sh

# 5. Install IB Gateway
RUN wget -q https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh -O /tmp/ibgateway-installer.sh && \
    sh /tmp/ibgateway-installer.sh -q -dir /root/Jts/ibgateway && \
    rm /tmp/ibgateway-installer.sh
