# Stage 1: Build the React application
FROM node:14-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:1.21-alpine as production-stage
COPY --from=build-stage /app/build /usr/share/nginx/html

# Replace the default nginx.conf with your custom file
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
