FROM node:12-alpine AS node-development

# RUN mkdir /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g @angular/cli

COPY . .

FROM node-development AS node-build-production

RUN npm install

RUN ng build --prod

