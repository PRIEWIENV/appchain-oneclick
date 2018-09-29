# appchain-oneclick

## Overview


### commit

- CITA: e5ccb40
- Microscope: bef33a9
- Re-Birth: 4c9eec1

## Usage

### Get the Repo

```bash
git clone git@github.com:PRIEWIENV/appchain-oneclick.git --recursive
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
