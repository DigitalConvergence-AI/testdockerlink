#FROM node
#RUN mkdir /usr/src/app
#COPY . /usr/src/app
#WORKDIR /usr/src/app
#ENV PATH /usr/src/app/node_modules/.bin:$PATH
#RUN npm install
#CMD ["npm","start"]

# pull official base image
FROM node:13.12.0-alpine

# set working directory
RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package-lock.json /app/package-lock.json
COPY package.json /app/package.json

COPY . /app

RUN npm install

RUN npm run build
# start app
CMD ["npm", "start"]


