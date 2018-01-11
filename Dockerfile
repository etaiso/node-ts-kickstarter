#Retrieve node latest build
FROM node:7.7.1-alpine

#Create app directory
RUN mkdir -p /usr/src/app

#Change current dir
WORKDIR /usr/src/app

#Installing Typescript
RUN npm install -g typescript@2.4.2
#Copying package.json to our app dir
COPY package.json /usr/src/app/

#Copying package.json to our app dir
COPY .npmrc /usr/src/app/
#Installing npm dependencies
RUN npm install

# Bundle app source
COPY . /usr/src/app
# Building the Typescript
RUN sh -c tsc -p .

#Exposing app port
EXPOSE 3007

#Running unit tests
#RUN npm test

#Starting the server
CMD [ "npm", "start" ]