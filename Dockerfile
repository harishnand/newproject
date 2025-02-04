# Use the official Nginx base image
FROM nginx:latest

# Copy custom HTML file (optional)
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
