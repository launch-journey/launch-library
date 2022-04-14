FROM nytimes/library:v1.3.0

# install custom files
COPY . ./custom/

# install custom npm packages
WORKDIR /usr/src/tmp
COPY package*.json ./
RUN npm i
RUN yes | cp -rf ./node_modules/* /usr/src/app/node_modules

# return to app and build
WORKDIR /usr/src/app
RUN npm run build

# start app
CMD [ "npm", "start" ]
