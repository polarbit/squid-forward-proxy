FROM alpine:3.7

RUN apk add squid \
 && apk add acf-squid