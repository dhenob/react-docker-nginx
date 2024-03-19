# React Application with Nginx Dockerization

This project demonstrates how to dockerize a simple React application using Nginx as a web server. The setup includes a two-stage Docker build process where the first stage builds the React app, and the second stage sets up Nginx to serve the app.

## Project Structure

- `Dockerfile`: Contains instructions for building the Docker image for the React app.
- `nginx.conf`: Custom Nginx configuration file to serve the React application.
- `src/`: Directory containing the source code of the React application.
- `package.json`: Node.js manifest file, which includes dependencies and build scripts.

## Prerequisites

- Docker installed on your machine.
- Node.js and npm installed if you want to run the React app locally.

## Building the Docker Image

To build the Docker image, navigate to the root directory of this project and run the following command:

```bash
docker build -t hello-world-react-app .

Running the Docker Container
Once the image is built, you can run the Docker container using the following command:


docker run -p 8080:80 hello-world-react-app
This command runs the Docker container and maps port 80 inside the container to port 8080 on your host machine.

Accessing the Application
After the container is running, you can access the React application by navigating to http://localhost:8080 in your web browser.

Custom Nginx Configuration
The nginx.conf file in this project is configured to serve the static files of the React application and handle client-side routing by redirecting all non-file requests to index.html. This behavior is essential for single-page applications (SPAs) that use client-side routing mechanisms.

