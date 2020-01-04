FROM node:10.18.0-stretch-slim

WORKDIR /app

COPY isucon9-qualify/webapp/nodejs/package.json isucon9-qualify/webapp/nodejs/package-lock.json /app/

RUN npm ci

COPY isucon9-qualify/webapp/nodejs/ /app/
COPY isucon9-qualify/webapp/public/ /app/public/

EXPOSE 8000

CMD [ "npm", "run", "start" ]