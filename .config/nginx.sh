#!/bin/sh

for file in /etc/nginx/http.d/*.template; do
    mv "$file" "${file%.template}"
done

# Start Nginx
nginx -g "daemon off;"
