FROM alpine:3.7
LABEL maintainer="safakulusoy@gmail.com"

RUN apk add squid \
 && apk add acf-squid

EXPOSE 3128/tcp
