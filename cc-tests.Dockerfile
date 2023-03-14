FROM node:18-alpine

RUN apk add chromium

WORKDIR /app

ENV CHROME_BIN=/usr/bin/chromium-browser

COPY ./. ./
RUN npm install -g npm@8.1.2
# RUN npm install node-sass
RUN npm install
RUN npm run test-headless
