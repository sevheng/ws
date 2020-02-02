FROM nginx:1.16-alpine

COPY ./docker-entrypoint.sh .

RUN chmod +x ./docker-entrypoint.sh

# Remove nginx default config
RUN rm /etc/nginx/conf.d/default.conf

ENTRYPOINT './docker-entrypoint.sh'