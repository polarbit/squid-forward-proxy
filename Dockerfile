FROM alpine:3.10.3
LABEL maintainer="safakulusoy@gmail.com"

RUN apk add squid && apk add --no-cache bash 

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]
