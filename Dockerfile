FROM nginx:1.16-alpine

COPY ./docker_entrypoint.sh .

RUN chmod +x ./docker_entrypoint.sh

# Remove nginx default config
RUN rm /etc/nginx/conf.d/default.conf

ENTRYPOINT './docker_entrypoint.sh'