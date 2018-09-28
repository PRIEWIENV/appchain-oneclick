# appchain-oneclick

## Usage

### Get the Repo

```bash
git submodule init && git submodule update
```

### Build cita

```bash
cd cita/cita && git submodule init && git submodule update && ./env.sh make release
```

### Build & Configure Microscope

```bash
cd ../microscope/microscope
cp ../.env ./
yarn install
yarn run dll && yarn run build:prod
```

### Configure re-birth

```bash
cd ..
cp re-birth/.env.local re-birth/re-birth/
```

### Start the docker compose

```bash
docker-compose build
docker-compose run --rm app bundle exec rake db:setup
docker-compose up
```
