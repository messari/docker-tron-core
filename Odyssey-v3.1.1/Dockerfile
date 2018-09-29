FROM tronprotocol/tron-gradle

# Setup gosu for easier command execution
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

ENV TRON_SHASUM="be5bf6a1f2625dff56f12bdce75d4bede03b0a5e860f3b920b8c35ce0480060c Odyssey-v3.1.1.tar.gz"

# 1. download tron
RUN set -o errexit -o nounset \
  && mkdir /java-tron \
  && mkdir /java-tron/logs \
  && curl -LO https://github.com/tronprotocol/java-tron/archive/Odyssey-v3.1.1.tar.gz \
  && echo "${TRON_SHASUM}" | sha256sum -c \
  && tar --strip=1 -xzf *.tar.gz -C /java-tron \
  && rm *.tar.gz

# 2. overwrite logback so we get STDOUT logs instead of logs written to container
COPY logback.xml /java-tron/src/main/resources/logback.xml

# 3. build tron
RUN set -o errexit -o nounset \
    && cd java-tron \
    && gradle build

RUN useradd -r tron

WORKDIR /java-tron

COPY docker-entrypoint.sh /entrypoint.sh
COPY main_net_config.conf /java-tron/

ENTRYPOINT ["/entrypoint.sh"]

# 18888 FullNode P2P
# 8090 FullNode HTTP
# 50051 GRPC
EXPOSE 18888 8090 50051

CMD ["FullNode.jar"]
