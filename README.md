# Nervos AppChain OneClick

Nervos AppChain OneClick is based on Nervos AppChain tool chain. It combines almost all the Nervos AppChain development necessities,  including [CITA](), [Microscope]() and [ReBirth](), into one package. Developers who want to quickly start Nervos AppChain to have an overview or want to perform an agile prototype development only need to enter a few command lines.

## Overview

### Nervos AppChain tools support

- CITA: v0.19
- Microscope: bef33a9
- ReBirth: 4c9eec1

### 

## Disclaimer

appchain-oneclick is just a developing tool now, do not take it as an official chain.

## Usage

### Requirements

- Docker
- Docker Compose

### Get the Repo

```bash
git clone https://github.com/PRIEWIENV/appchain-oneclick.git --recursive
cd appchain-oneclick
```

### Configure

```bash
./configure.sh
```

### Build the docker compose

Run once when first use.

```bash
docker-compose build
docker-compose run --rm app bundle exec rake db:setup
```

### Start docker compose

```bash
docker-compose up
```

### Exposed port

- CITA: http://localhost:1337/
- ReBirth: http://localhost:8888/
- Microscope: http://localhost:8080/
