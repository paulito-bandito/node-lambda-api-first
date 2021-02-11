FROM node:11

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Alpine is particular about where it should have it's files
WORKDIR /usr/app

# Install node_modules
COPY ./project-backend/package.json /usr/app/package.json
RUN npm install --quiet

# Copy all the files in this application root
COPY ./project-backend/ usr/app/

RUN npm install -g nodemon

CMD npm run dev
