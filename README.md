# Container nginx with auto https by using letsencrypt

## Docker-compose

```yml
version: "3"

services:
  web_server:
    image: ghcr.io/sevheng/ws/nginx:latest
    volumes:
      - ./nginx/conf:/nginx/conf
      - ws_letsencrypt:/etc/letsencrypt
    environment:
      - EMAIL=example@example.com
      - DOMAIN=-d example.com
    ports:
      - 80:80
      - 443:443
volumes:
    ws_letsencrypt:
```

## Nginx Config Folder

Map this folder to nginx folder in container and it will auto config to nginx

- nginx.conf
- conf.d (folder)
- html (folder)
- header (folder)
- upstream (folder)
- security (folder)
- util (folder)
