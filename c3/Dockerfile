FROM node:latest
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi

COPY . ./

RUN apt-get update
RUN apt-get install iputils-ping -y

ENV PORT 3000
EXPOSE $PORT
CMD ["node", "server.js"]