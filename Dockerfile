FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy static assets
COPY src/ /usr/share/nginx/html/

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 3000
EXPOSE 8081

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]