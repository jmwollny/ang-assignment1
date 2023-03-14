FROM node:17-alpine
COPY ./. ./
RUN npm install node-sass
RUN npm install
