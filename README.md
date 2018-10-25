# Nervos AppChain OneClick Light

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
git clone -b develop https://github.com/PRIEWIENV/appchain-oneclick.git --recursive
cd appchain-oneclick
```
> Make sure that you are in the `develop` branch and there is submodule code of Microscope in the folder `appchain-oneclick/microscope/microscope`.

### 2. Configuration

```bash
./configure.sh
```
> If the `shasum` check fails, just delete the archive file `cita/cita_secp256k1_sha3.tar.gz` and run `./configure.sh` again. If the download process is stuck while configuring, you can download the [cita v0.19 release](https://github.com/cryptape/cita/releases) manually instead and then run `./configure.sh`.

### 3. Start the docker compose

```bash
docker-compose build
docker-compose up
```

### 4. Exposed port

* CITA: http://localhost:1337/
* Microscope: http://localhost:8080/

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
docker-compose down
```

* Rebuild all the docker images

```bash
docker compose build --no-cache
```

