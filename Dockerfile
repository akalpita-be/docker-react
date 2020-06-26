FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#AWS EB looks for below line for the port mapping for incoming traffic.
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html