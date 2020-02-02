
echo "Copy nginx.conf"
cp /nginx/nginx.conf /etc/nginx/nginx.conf

echo "Copy nginx/conf.d"
cp -r /nginx/conf.d /etc/nginx

echo "Start nginx"
nginx -g "daemon off;"