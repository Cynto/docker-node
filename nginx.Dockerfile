FROM alpine

RUN apk add --no-cache nginx gettext

COPY ./.config/default.conf.template /etc/nginx/http.d/default.conf.template

COPY ./.config/nginx.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
