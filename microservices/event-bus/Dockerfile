FROM node:alpine

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

EXPOSE 4005

CMD ["node", "index.js"]
