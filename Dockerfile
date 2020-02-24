FROM nginx:1.16-alpine

# Install certbot
RUN apk add --no-cache certbot

# Copy renew cron script
COPY ./renew /etc/periodic/daily/renew
RUN chmod +x /etc/periodic/daily/renew

RUN mkdir /var/lib/certbot

COPY ./docker-entrypoint.sh .

RUN chmod +x ./docker-entrypoint.sh

# Remove nginx default config
RUN rm /etc/nginx/conf.d/default.conf

ENTRYPOINT './docker-entrypoint.sh'