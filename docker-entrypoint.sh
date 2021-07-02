#!/bin/sh

echo "Email : ${EMAIL}"
echo "Domains : ${DOMAINS}"

echo "Check nginx.conf"
cp -r ./nginx/nginx.conf /etc/nginx/nginx.conf # default
echo "Check conf"
cp -r ./nginx/conf/* /etc/nginx/conf.d # default
echo "Check util"
cp -r ./nginx/util /etc/nginx/util # default
echo "Check security"
cp -r ./nginx/security /etc/nginx/security # default
echo "Check upstream"
cp -r ./nginx/upstream /etc/nginx/upstream # default
echo "Check html"
cp -r ./nginx/html /etc/nginx/html # default

#Join $domains to -d args
domain_args=""
for domain in $DOMAINS; do
  domain_args="$domain_args -d $domain"
done

echo "map domain${domain_args}"

if [ "$USE_SSL" == "true" ]
then

  # Enable staging mode if needed
  if [ $SSL_STAGING != "1" ]; then staging_arg="--staging"; fi

  # Get certs
  certbot certonly \
    -n $domain_args \
    --email $EMAIL \
    $staging_arg \
    --standalone --preferred-challenges http --agree-tos --expand

  # Kick off cron
  /usr/sbin/crond -f -d 8 &
fi

echo "Start nginx"
nginx -g "daemon off;"