#!/bin/sh

email=$EMAIL
domain=$DOMAIN

echo "email : ${email}"
echo "doamin : ${domain}"

echo "Copy nginx.conf"
cp /nginx/nginx.conf /etc/nginx/nginx.conf

echo "Copy nginx/conf.d"
cp -r /nginx/conf.d /etc/nginx

# Get certs
certbot certonly -n $domain \
  --standalone --preferred-challenges http --email $email --agree-tos --expand

# Kick off cron
/usr/sbin/crond -f -d 8 &

echo "Start nginx"
nginx -g "daemon off;"