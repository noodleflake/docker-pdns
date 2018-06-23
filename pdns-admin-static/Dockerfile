FROM nginx:alpine
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

ENV PDNS_ADMIN_UWSGI_HOST="localhost" \
 PDNS_ADMIN_UWSGI_PORT=9494

RUN apk add --no-cache curl

RUN mkdir -p /opt/powerdns-admin \
  && curl -sSL https://git.0x97.io/0x97/powerdns-admin/repository/master/archive.tar.gz \
    | tar -xzC /opt/powerdns-admin --strip 1 \
  && find /opt/powerdns-admin -path /opt/powerdns-admin/app/static -prune -o -type f -exec rm -f {} + \
  && chown -R root: /opt/powerdns-admin

COPY pdns-nginx.template /etc/nginx/conf.d/default.template
COPY start.sh /etc/nginx/start.sh

RUN chmod +x /etc/nginx/start.sh

CMD ["/etc/nginx/start.sh"]
