# Use the official Nginx base image
FROM nginx:latest

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
