FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app

# Copy .json files to /usr/src/app dir (container)
COPY ["package.json", "package-lock.json", "./"]
RUN npm install --production --silent && mv node_modules ../

COPY . .
EXPOSE 8080

RUN chown -R node /usr/src/app
USER node
CMD ["node", "./src/server.js"]
