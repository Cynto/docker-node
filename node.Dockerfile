FROM alpine

COPY ./.config/node.sh ./start.sh

RUN apk add --no-cache \ 
    nodejs npm && \
    mkdir -p /app \
    && chmod +x ./start.sh 
    
CMD [ "tail", "-f" ]
