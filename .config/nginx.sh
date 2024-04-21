#!/bin/sh

# Substitute environment variables in the Nginx configuration template
envsubst < /etc/nginx/http.d/default.conf.template > /etc/nginx/http.d/default.conf

# Start Nginx
nginx -g "daemon off;"
