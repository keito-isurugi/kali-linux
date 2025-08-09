FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    net-tools \
    iputils-ping \
    nmap \
    metasploit-framework \
    burpsuite \
    gobuster \
    dirb \
    nikto \
    sqlmap \
    john \
    hashcat \
    hydra \
    wfuzz \
    ffuf \
    netcat-traditional \
    socat \
    curl \
    wget \
    git \
    python3 \
    python3-pip \
    vim \
    nano \
    tmux \
    openssh-client \
    openvpn \
    proxychains4 \
    smbclient \
    enum4linux \
    dnsutils \
    tcpdump \
    wireshark \
    exploitdb \
    seclists \
    wordlists \
    python3-pwntools \
    python3-impacket \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN mkdir -p /root/tools /root/workspace

CMD ["/bin/bash"]