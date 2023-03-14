FROM node:18-alpine

RUN apk add chromium

WORKDIR /app

ENV CHROME_BIN=/usr/bin/chromium-browser

COPY ./. ./
RUN npm install
RUN npm run test-headless
