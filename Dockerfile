FROM golang:alpine as builder

RUN apk add --no-cache make git
RUN git clone https://github.com/micromdm/micromdm.git /go/src/github.com/micromdm

WORKDIR /go/src/github.com/micromdm/micromdm/

ENV CGO_ENABLED=0 \
	GOARCH=amd64 \
	GOOS=linux

RUN make deps
RUN make

FROM alpine

ENV MICROMDM_CONFIG_DIR="/data/config"
ENV MICROMDM_CERTS_DIR="/data/certs"
ENV MICROMDM_REPO_DIR="/data/repo"

VOLUME "/data"

COPY docker-entrypoint.d /docker-entrypoint.d
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apk --update add ca-certificates
COPY --from=builder /go/src/github.com/micromdm/micromdm/build/linux/micromdm /usr/bin/
COPY --from=builder /go/src/github.com/micromdm/micromdm/build/linux/mdmctl /usr/bin/
RUN chmod a+x /usr/local/bin/micromdm
RUN chmod a+x /usr/local/bin/mdmctl
RUN mkdir -p ${MICROMDM_CONFIG_DIR} ${MICROMDM_CERTS_DIR} ${MICROMDM_REPO_DIR}
RUN chmod +x /docker-entrypoint.d/*.sh
RUN chmod a+x /docker-entrypoint.sh

EXPOSE 80 443 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
