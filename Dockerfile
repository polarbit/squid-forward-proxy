FROM alpine:3.10.3
LABEL maintainer="safakulusoy@gmail.com"

RUN apk add squid \
 && apk add --no-cache bash 

EXPOSE 3128/tcp

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
