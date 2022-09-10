FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#COPY ./build/src/ ./

RUN rm -rf /src

#RUN rm -rf /build

EXPOSE 8080
CMD [ "npm", "run", "start:docker"]