FROM nginx:1.18-alpine

# Install certbot
RUN apk add --no-cache certbot

# Copy renew cron script
COPY ./renew /etc/periodic/daily/renew
RUN chmod +x /etc/periodic/daily/renew

RUN mkdir /var/lib/certbot

ADD . ./nginx
# COPY ./docker-entrypoint.sh .

RUN chmod +x ./nginx/docker-entrypoint.sh

# Remove nginx default config
RUN rm /etc/nginx/conf.d/default.conf

ENTRYPOINT './nginx/docker-entrypoint.sh'