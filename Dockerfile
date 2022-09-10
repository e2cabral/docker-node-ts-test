FROM node:14 as builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN rm -rf /src

FROM node:14-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY --from=builder /usr/src/app ./app

EXPOSE 8080
CMD [ "npm", "run", "start:docker"]