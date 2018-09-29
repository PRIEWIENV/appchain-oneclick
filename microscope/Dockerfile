FROM node:10.11.0-alpine AS build

RUN apk --no-cache add build-base \
                       git \
                       python

WORKDIR /src/microscope

COPY microscope/ .

RUN yarn install && yarn run dll && yarn run build:prod



FROM nginx:1.15.4-alpine

WORKDIR /opt/nginx

COPY --from=build /src/microscope/dist/ dist/

RUN mkdir log

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]
