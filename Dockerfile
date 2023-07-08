FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget curl xrdp tasksel jq kubuntu-desktop jq xterm && \
    echo "startkde" > ~/.xsession && \
    sed -i.bak '/fi/a #xrdp multiple users configuration \n startkde \n' /etc/xrdp/startwm.sh && \
    wget https://bin.equinox.io/c/VdrWdbjqyF/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip && \
    ./ngrok authtoken 2N5KFYmyocPObelDKx26R1e2gfP_MiFweWSd9A8CbrC1E9Ef

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3389

ENTRYPOINT ["/entrypoint.sh"]
