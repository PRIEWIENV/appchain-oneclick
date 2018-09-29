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
./env.sh make release
```

### Configuration

```bash
./configure.sh
```

### Start the docker compose

```bash
docker-compose build
docker-compose run --rm app bundle exec rake db:setup
docker-compose up
```
