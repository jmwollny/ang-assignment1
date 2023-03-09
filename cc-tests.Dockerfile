FROM node:current-alpine3.12
RUN apk add chromium
RUN apt install python3.7 -y
WORKDIR /app

ENV CHROME_BIN=/usr/bin/chromium-browser

COPY ./. ./
RUN npm install
# RUN npm run test-headless