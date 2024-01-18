# Use an official Node runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock if using Yarn)
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define the command to run your app using CMD which defines your runtime
CMD ["npm", "run", "serve"]