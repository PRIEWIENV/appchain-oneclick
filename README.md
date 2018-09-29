# appchain-oneclick

## Usage

### Requirements

- Docker 17.05 or higher
- Docker Compose

### Get the Repo

```bash
git clone git@github.com:PRIEWIENV/appchain-oneclick.git --recursive
cd appchain-oneclick
```

### Build cita

```bash
cd cita/cita && git submodule init && git submodule update && ./env.sh make release
```

### Build & Configure Microscope

```bash
cd ../../microscope/microscope
cp ../.env ./
yarn install
yarn run dll && yarn run build:prod
```

### Configure re-birth

```bash
cd ../..
cp re-birth/.env.local re-birth/re-birth/
```

### Start the docker compose

```bash
docker-compose build
docker-compose run --rm app bundle exec rake db:setup
docker-compose up
```
