# build stage
FROM node:18.14.2 AS build-stage
WORKDIR /quasar_app
COPY .npmrc ./
COPY package-lock.json ./
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build:ssr

# production stage
FROM node:18.14.2 AS production-stage
WORKDIR /app
COPY --from=build-stage /quasar_app/dist/ssr .
RUN npm install
RUN npm install pm2 -g
EXPOSE 3000
CMD ["pm2-runtime", "index.js"]
