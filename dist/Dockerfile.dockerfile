FROM node:13.12.0-alpine
RUN apk add netcat-openbsd bash
WORKDIR /dist
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install sequelize
RUN npm install sequelize-cli

# add app
COPY . ./


# start app
CMD ["tail", "-f", "/tmp"]