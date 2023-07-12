# build stage
FROM node:18.14.2 AS build-stage
WORKDIR /quasar_app
COPY .npmrc ./
COPY package-lock.json ./
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx AS production-stage
COPY --from=build-stage /quasar_app/dist/spa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
