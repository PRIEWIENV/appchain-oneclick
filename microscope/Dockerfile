FROM nginx:1.15.3

WORKDIR /opt/nginx

COPY microscope/dist/ dist/

RUN mkdir log

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]
