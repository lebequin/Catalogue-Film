FROM node:16

WORKDIR /app

RUN npm install -g @vue/cli

COPY package*.json /app/

RUN npm install

COPY . /app/

EXPOSE 8080

# Run the command to start the Vue.js development server
CMD ["npm", "run", "dev"]