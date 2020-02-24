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
certbot certonly -n -d $domain,www.$domain \
  --standalone --preferred-challenges http --email $email --agree-tos --expand

# Kick off cron
/usr/sbin/crond -f -d 8 &

echo "Start nginx"
while :; do sleep 6h & wait $!; nginx -s reload; done & nginx -g "daemon off;"