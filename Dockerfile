FROM node:16.14 AS build
WORKDIR ./app
COPY . .
RUN yarn install
RUN yarn build

FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build ./app/dist/my-angular-app/ /usr/share/nginx/html
EXPOSE 80

