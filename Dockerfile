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

# Adjust permissions before switching to non-root user
COPY nginx.conf /etc/nginx/nginx.conf
RUN chown -R nginx:nginx /var/cache/nginx /var/log/nginx /usr/share/nginx/html /etc/nginx/nginx.conf && \
    chmod -R 755 /var/cache/nginx /var/log/nginx

# Now switch to non-root user
USER nginx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
