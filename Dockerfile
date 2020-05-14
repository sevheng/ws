FROM nginx:1.18-alpine

# Install certbot
RUN apk add --no-cache certbot

# Copy renew cron script
COPY ./renew /etc/periodic/daily/renew
RUN chmod +x /etc/periodic/daily/renew

RUN mkdir /var/lib/certbot

COPY ./docker-entrypoint.sh .
COPY ./error_page.conf /etc/nginx/error_page.conf

RUN chmod +x ./docker-entrypoint.sh

# Remove nginx default config
RUN rm /etc/nginx/conf.d/default.conf

ENTRYPOINT './docker-entrypoint.sh'