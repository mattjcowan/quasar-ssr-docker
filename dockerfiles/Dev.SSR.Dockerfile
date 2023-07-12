FROM node:18.14.2

WORKDIR /quasar_app

EXPOSE 9100

# the HMR port set in quasar.conf.js
EXPOSE 9025

CMD [ "npm", "run", "dev:ssr" ]