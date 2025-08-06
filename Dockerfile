FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    net-tools \
    iproute2 \
    iputils-ping \
    curl \
    wget \
    git \
    vim \
    nano \
    tmux \
    openssh-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install network and security tools
RUN apt-get update && \
    apt-get install -y \
    nmap \
    netcat-traditional \
    socat \
    openvpn \
    proxychains4 \
    dnsutils \
    tcpdump \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install web testing tools
RUN apt-get update && \
    apt-get install -y \
    gobuster \
    dirb \
    nikto \
    wfuzz \
    ffuf \
    burpsuite \
    sqlmap \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install exploitation tools
RUN apt-get update && \
    apt-get install -y \
    metasploit-framework \
    exploitdb \
    smbclient \
    enum4linux \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install password cracking tools
RUN apt-get update && \
    apt-get install -y \
    john \
    hashcat \
    hydra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-impacket \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install pwntools separately (often causes issues)
RUN apt-get update && \
    apt-get install -y python3-pwntools || true \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN mkdir -p /root/tools /root/workspace

COPY get-lhost.sh /root/get-lhost.sh
RUN chmod +x /root/get-lhost.sh

CMD ["/bin/bash"]