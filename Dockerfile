FROM alpine:3.7
LABEL maintainer="safakulusoy@gmail.com"

RUN apk add acf-squid

EXPOSE 3128/tcp

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
