FROM ubuntu:16.04

RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install -y \
    mailutils \
    postfix \
    curl \
    wget \
    file \
    bzip2 \
    gzip \
    unzip \
    bsdmainutils \
    python \
    util-linux \
    ca-certificates \
    tmux \
    lib32gcc1 \
    libstdc++6 \
    libstdc++6:i386 \
    binutils

RUN useradd -ms /bin/bash csserver

USER csserver
WORKDIR /home/csserver

RUN wget https://gameservermanagers.com/dl/csserver
RUN chmod +x csserver
RUN ./csserver auto-install

EXPOSE 27015
EXPOSE 27005

ENTRYPOINT ["./csserver"]

CMD ["details"]
