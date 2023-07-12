# Sample Quasar App

## Docker Setup

### Deploy to Dockerhub

#### Build

Build the SPA image locally:

```sh
docker build \
    -f ./dockerfiles/Deploy.SPA.Dockerfile \
    -t <your-dockerid>/quasar_spa_app:latest \
    src-app
```

Alternatively, build the SSR image locally:

```sh
docker build \
    -f ./dockerfiles/Deploy.SSR.Dockerfile \
    -t <your-dockerid>/quasar_ssr_app:latest \
    src-app
```

#### Push

First login to your Dockerhub account:

```sh
docker login -u <your-username> --password-stdin
# Then, type your password whem prompted
# A successful login is indicated by the promot 'Login Succeeded'
```

Push the image to Dockerhub:

```sh
docker push <your-dockerid>/quasar_spa_app:latest
# OR
docker push <your-dockerid>/quasar_ssr_app:latest
```

#### Pull

Remove the local image first:

```sh
docker rmi <your-dockerid>/quasar_spa_app:latest
# OR
docker rmi <your-dockerid>/quasar_ssr_app:latest
```

Run the container:

```sh
docker run -p 80:80 <your-dockerid>/quasar_spa_app:latest
# OR
docker run -p 80:3000 <your-dockerid>/quasar_ssr_app:latest

### Use Docker compose

Run a local development version of the app on port 9000, and a
production version on port 80.

Create a `docker-compose.yml` file:

```sh
version: "3.8"
services:
  # run the following scripts first:
  # ./scripts/docker-build-dev-image.sh
  # ./scripts/docker-build-dist-spa-image.sh
  # ./scripts/docker-build-dist-ssr-image.sh
  quasar_app_dev:
    build:
      dockerfile: dockerfiles/Dev.Dockerfile
    volumes:
      - ./src-app:/quasar_app
    ports:
      - "9000:9000"
  quasar_spa_app_latest:
    # image: <your-dockerid>/quasar_spa_app:latest
    image: quasar_app:dist-spa
    ports:
      - "8080:80"
  quasar_ssr_app_latest:
    # image: <your-dockerid>/quasar_spa_app:latest
    image: quasar_app:dist-ssr
    ports:
      - "3000:3000"
```

Use docker's built-in compose function to start the services:

```sh
docker compose up --force-recreate -d
```

You can then check out:

- Dev with HMR on http://localhost:9000
- SPA version on http://localhost:8080
- SSR version on http://localhost:3000

Remove the containers using:

```sh
docker compose down
```

### Deploy to a local registry

Setup a [local registry](https://docs.docker.com/registry/deploying/), and mount a volume across restarts:

```sh
mkdir -p /data/docker-registry

docker run -d \
  --restart=always \
  --name registry \
  -v /data/docker-registry:/var/lib/registry \
  #-p 5000:5000 \
  -p 127.0.0.1:5000:5000 \
  registry:2
```

Using TLS (with your own certs):

```sh
mkdir -p /data/docker-registry

docker run -d \
  --restart=always \
  --name registry \
  -v /data/docker-registry:/var/lib/registry \
  -v "$(pwd)"/certs:/certs \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  -p 443:443 \
  registry:2
```

Using TLS with LetsEncrypt:

```sh
mkdir -p /data/docker-registry/registry
mkdir -p /data/docker-registry/tls

docker run -d \
  --restart=always \
  --name registry \
  -v /data/docker-registry/tls:/etc/docker/registry/ \
  -v /data/docker-registry/registry:/var/lib/registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
  -e REGISTRY_HTTP_HOST=https://docker.example.com \
  -e REGISTRY_HTTP_TLS_LETSENCRYPT_CACHEFILE=/etc/docker/registry/letsencrypt.json \
  -e REGISTRY_HTTP_TLS_LETSENCRYPT_EMAIL=admin@example.com \
  #-e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
  -p 443:5000 \
  registry:2
```
