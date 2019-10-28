FROM alpine:3.7
LABEL maintainer="safakulusoy@gmail.com"

RUN apk add acf-squid && apk add --no-cache bash

EXPOSE 3128/tcp

COPY squid.conf /etc/squid/squid.conf
COPY squid.whitelist /etc/squid/squid.whitelist
COPY squid.passwords /etc/squid/squid.passwords

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
