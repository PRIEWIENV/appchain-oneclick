# appchain-oneclick

## Usage

```bash
git submodule init && git submodule update
cd cita/cita && git submodule init && git submodule update && ./env.sh make release
cd ../re-birth/re-birth
yarn install
yarn run dll && yarn run build:prod
cd ..
docker-compose build
docker-compose run --rm app bundle exec rake db:setup
docker-compose up
```
