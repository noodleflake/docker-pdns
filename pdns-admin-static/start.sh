#!/bin/sh

envsubst '${PDNS_ADMIN_UWSGI_HOST} ${PDNS_ADMIN_UWSGI_PORT}' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
