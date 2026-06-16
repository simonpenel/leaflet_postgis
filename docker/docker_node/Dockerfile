# Set ubuntu
FROM ubuntu:24.04
FROM node:22
ENV DEBIAN_FRONTEND=noninteractive
# File Author / Maintainer
MAINTAINER Simon Penel
RUN apt-get update
RUN apt-get install -y nodejs npm
#sudo ln -s /usr/bin/nodejs /usr/local/bin/node
#sudo ln -s /usr/bin/npm /usr/local/bin/npm
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*json ./
# Copy the web directory
#COPY web ./
RUN npm install
# If you are building your code for production
# RUN npm install --only=production
# Install redis-client
# Install redis
# Utile pour debuger,  pas necessaire pour l'appli
#RUN wget http://download.redis.io/releases/redis-stable.tar.gz
#RUN tar xzf redis-stable.tar.gz
#RUN cd redis-stable;ls;make;make test;make install
# Bundle app source
COPY . .
# Expose Node Express port 8080
EXPOSE 8080
EXPOSE 5432
# Expose Redis port 6379
#EXPOSE 6379
CMD [ "npm", "start" ]