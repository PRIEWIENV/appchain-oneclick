# Nervos AppChain OneClick Light

## Usage

### Requirements

- Docker 17.05 or higher
- Docker Compose

### 1. Get the Repo

```bash
git clone -b develop https://github.com/PRIEWIENV/appchain-oneclick.git --recursive
cd appchain-oneclick
```

### 2. Configuration

```bash
./configure.sh
```

### 3. Start the docker compose

```bash
docker-compose build
docker-compose run --rm app bundle exec rake db:setup
docker-compose up
```

### Stop and Restart

#### Stop docker compose gracefully

Just press <kbd>Ctrl</kbd> + <kbd>C</kbd> once.

#### Restart

```bash
docker-compose up
```

#### Clean all the data

```bash
rm -rf cita/cita_secp256k1_sha3/test-chain
docker-compose down
```

#### Rebuild all the docker images

```bash
docker compose build --no-cache
```
