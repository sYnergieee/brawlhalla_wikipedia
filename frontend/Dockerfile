FROM node:18.17.1 as build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/frontend_brawlhalla_wiki /usr/share/nginx/html
EXPOSE 4200