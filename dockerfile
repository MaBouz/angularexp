FROM node:16-alpine AS build
WORKDIR /app2
COPY package*.json ./
RUN npm install --force
COPY . .
RUN npm run build --force

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app2/dist/angularexp /usr/share/nginx/html
