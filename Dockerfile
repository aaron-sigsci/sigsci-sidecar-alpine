FROM alpine:latest

RUN apk add --no-cache curl
RUN curl https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz | tar -zxf - -C /usr/sbin/
RUN curl https://dl.signalsciences.net/sigsci-module-nginx/sigsci-module-nginx_latest.tar.gz | tar -zxf - -C /
RUN mkdir -p /opt/sigsci/nginx

COPY /start.sh /start.sh
RUN chmod +x start.sh

ENTRYPOINT ["/start.sh"]