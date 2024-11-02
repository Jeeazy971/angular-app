FROM node:20.18 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install -g @angular/cli

RUN npm install --silent

COPY . ./

# VOLUME [ "/app/node_modules" ]

ARG DEFAULT_PORT=4200

ENV PORT=$DEFAULT_PORT

EXPOSE $DEFAULT_PORT

ENV CHOKIDAR_USEPOLLING=true

CMD ["ng", "serve", "--host", "0.0.0.0", "--poll", "2000"]



