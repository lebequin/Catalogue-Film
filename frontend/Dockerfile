FROM node:16

WORKDIR /app

COPY package*.json /app/

RUN npm install && npm cache clean --force

ENV PATH ./app/node_modules/.bin/:$PATH

COPY . /app/

EXPOSE 8080

# Run the command to start the Vue.js development server
#CMD ["npm", "run", "build"]

