# simple-flask-app with Nginx and Supervisor
This project is just for learning and provides a Dockerized Flask application with Nginx as a reverse proxy and Supervisor to manage processes. The application includes two pages, "index.html" and "contactus.html," and utilizes a simple CSS file for styling.

## Getting Started

### Clone the Repository
```
git clone https://github.com/rajneeshmishra83/simple-flask-app.git
cd simple-flask-app
```
### Build and Run with Docker
```
docker build -t simple-flask-app .
docker run -p 80:80 simple-flask-app
```
Visit http://localhost to access the home page and http://localhost/contactus for the contact us page.

## Project Structure
+ app.py: The Flask application file.
+ requirements.txt: Python dependencies for the Flask app.
+ templates/: HTML templates for the Flask app.
+ static/css/main.css: CSS file for styling.
+ nginx.conf: Nginx configuration file.
+ supervisord.conf: Supervisor configuration file.

## Notes
* The Flask app runs on port 5000 within the Docker container.
* Nginx acts as a reverse proxy, forwarding requests from port 80 to the Flask app.
* Supervisor is used to manage both Nginx and the Flask app processes.
