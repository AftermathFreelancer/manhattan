FROM node:lts-alpine

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./
COPY ./frontend/package*.json ./frontend/

# install project dependencies
RUN npm install

# Install frontend packages
RUN npm install --prefix ./frontend/

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# Build production file
RUN npm run build --prefix ./frontend/

# Run the app
CMD [ "node", "index.js" ]