FROM ubuntu:18.04

RUN mkdir -p /opt/coin
WORKDIR /opt/coin

EXPOSE 6999

RUN apt-get update && apt-get install -y wget xz-utils libzmq5 libboost-all-dev software-properties-common
RUN add-apt-repository -y ppa:bitcoin/bitcoin && apt-get install -y libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libevent-dev
RUN wget https://github.com/mceme/ImageCoin/releases/download/1.0.24.1/ImageCoin-linux18_x86_64.tar.xz -O - | tar -C /opt/coin -xJf -

# cleanup
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/opt/coin/data", "/opt/coin/coin.conf"]

ENTRYPOINT ["/opt/coin/ImageCoind"]
CMD ["-conf=/opt/coin/coin.conf"]
