FROM alpine

ENV MICROMDM_VERSION=1.6.0
ENV MICROMDM_CONFIG_DIR="/data/config"
ENV MICROMDM_CERTS_DIR="/data/certs"
ENV MICROMDM_REPO_DIR="/data/repo"

COPY docker-entrypoint.d /docker-entrypoint.d
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apk --no-cache add curl
RUN apk --update add ca-certificates
RUN curl -L https://github.com/micromdm/micromdm/releases/download/v${MICROMDM_VERSION}/micromdm_v${MICROMDM_VERSION}.zip -o /micromdm.zip
RUN unzip /micromdm.zip
RUN rm /micromdm.zip
RUN mv /build/linux/micromdm /usr/local/bin
RUN mv /build/linux/mdmctl /usr/local/bin
RUN rm -r /build
RUN chmod a+x /usr/local/bin/micromdm
RUN chmod a+x /usr/local/bin/mdmctl
RUN apk del curl
RUN mkdir -p ${MICROMDM_CONFIG_DIR} ${MICROMDM_CERTS_DIR} ${MICROMDM_REPO_DIR}
RUN chmod +x /docker-entrypoint.d/*.sh
RUN chmod a+x /docker-entrypoint.sh

EXPOSE 80 443 8080

VOLUME ${MICROMDM_CONFIG_DIR}
VOLUME ${MICROMDM_CERTS_DIR}
VOLUME ${MICROMDM_REPO_DIR}]

ENTRYPOINT ["/docker-entrypoint.sh"]
