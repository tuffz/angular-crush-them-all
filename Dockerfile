FROM node:14-alpine AS node-development

WORKDIR /usr/src/app

RUN npm install -g @angular/cli

COPY . .

FROM node-development AS node-build-production

RUN npm install

RUN ng build --prod

FROM nginx:alpine as nginx-production

COPY --from=node-build-production /usr/src/app/dist/crush-them-all /usr/share/nginx/html

COPY --from=node-build-production /usr/src/app/docker/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
