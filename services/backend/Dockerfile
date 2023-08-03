# Node image
FROM node:18.17

# Set the working directory
WORKDIR /backend

COPY ./package*.json ./

# Install packages
RUN npm install

# Copy over directory
COPY . .

# Start the application
CMD ["npm", "start"]