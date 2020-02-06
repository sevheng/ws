
echo "Copy nginx.conf"
cp /nginx/nginx.conf /etc/nginx/nginx.conf

echo "Copy nginx/conf.d"
cp -r /nginx/conf.d /etc/nginx

echo "Start nginx"
while :; do sleep 6h & wait $${!}; nginx -s reload; done & nginx -g "daemon off;"