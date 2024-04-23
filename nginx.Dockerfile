FROM alpine

RUN apk add --no-cache nginx

COPY ./.config/default.conf.template /etc/nginx/http.d/default.conf.template

ARG PORT=${PORT}
ARG NODE_PORT=${NODE_PORT}

RUN sed -i "s/{{PORT}}/${PORT}/g" /etc/nginx/http.d/default.conf.template && \
    sed -i "s/{{NODE_PORT}}/${NODE_PORT}/g" /etc/nginx/http.d/default.conf.template

COPY ./.config/nginx.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
