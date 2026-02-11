# JRE base
FROM eclipse-temurin:19-jre-jammy

# Environment variables
ENV SERVER_PROVIDER="forge" \
    LAZYMC_VERSION="latest" \
    MC_VERSION="1.20.1" \
    SERVER_BUILD="47.2.0" \
    MC_RAM="" \
    JAVA_OPTS=""

COPY mcserver.sh .
RUN apt update \
    && apt install -y wget jq curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /mcserver

# Start script
CMD ["sh", "./mcserver.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
EXPOSE 25575/tcp
EXPOSE 25575/udp
VOLUME /mcserver