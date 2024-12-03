FROM ubuntu:latest

ARG file_name=ZenithProxy-launcher-linux-amd64.zip

WORKDIR /app
WORKDIR /home/container

RUN apt-get update && apt-get install -y wget unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/$file_name https://github.com/rfresh2/ZenithProxy/releases/download/launcher-v3/$file_name && \
    unzip /tmp/$file_name -d /home/container && \
    rm /tmp/$file_name

USER container
ENV  USER container
ENV HOME /home/container

COPY /entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
