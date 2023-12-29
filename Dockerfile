# Use an official Nginx image as a parent image
FROM nginx:alpine

# Set the working directory to /app
WORKDIR /app

# Copy the Flask app files to the container
COPY app.py .
COPY requirements.txt .

# Install Python and Flask dependencies 
RUN apk --no-cache add python3 py3-pip \
	&& pip3 install --no-cache-dir -r requirements.txt

# Copy the HTML and CSS templates
COPY templates/index.html /app/templates/
COPY templates/contactus.html /app/templates
COPY templates/base.html /app/templates
COPY static/css/main.css /app/static/css/

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx and run the Flask app using supervisor
RUN apk add --no-cache supervisor
COPY supervisord.conf /etc/supervisord.conf

# Start supervisor to manage processes
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

