## Docker-compose

```yml
version: "3"

services:
  ws:
    image: registry.gitlab.com/rovool/core/ws:latest
    volumes:
      - ./nginx:/nginx
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

## Nginx Folder

- nginx.conf
- conf.d (folder)
- html (folder)
