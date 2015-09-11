# FragDenStaat.de Infra

Checkout recursively or initialise and update the submodules.

Install `docker` and `docker-compose`.

```
docker-compose build
docker-compose start
```

Example how to attach to the running web container:

```
docker exec -i -t fragdenstaatdeinfra_web_1 bash
```

## TODO

 - ship with custom configuration
 - get [docker compose environment variables](http://docs.docker.com/compose/env/) to connect web/worker container to services
 - email container!
