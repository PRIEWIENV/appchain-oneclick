# Nervos AppChain OneClick Full

## Components Support

- CITA: v0.19
- Microscope: `develop:a7a2bde`
- ReBirth: `master:073d982`

## Quick Start

### Requirements

- [Docker](https://docs.docker.com/install/) 17.05 or higher
- [Docker Compose](https://docs.docker.com/compose/install/)

### 1. Get the Repo

```bash
git clone https://github.com/PRIEWIENV/appchain-oneclick.git --recursive
cd appchain-oneclick
```

### 2. Configure

```bash
./configure.sh
```

### 3. Build the docker compose

Run once when first use.

```bash
docker-compose build
docker-compose run --rm app bundle exec rake db:setup
```

ReBirth database will be stored into the directory `docker/data`. This folder is root-privileged due to ReBirth itself. You don't need to run `docker-compose run --rm app bundle exec rake db:setup` again if this folder is not damaged.

### 4. Start docker compose

```bash
docker-compose up
```

### 5. Exposed port

- CITA: http://localhost:1337/
- ReBirth: http://localhost:8888/
- Microscope: http://localhost:8080/

### Stop and Restart

* Stop docker compose gracefully

Just press <kbd>Ctrl</kbd> + <kbd>C</kbd> once.

* Restart

```bash
docker-compose up
```

* Clean all the data

```bash
rm -rf cita/cita_secp256k1_sha3/test-chain
rm -rf docker
docker-compose down
```

* Rebuild all the docker images

```bash
docker compose build --no-cache
```

