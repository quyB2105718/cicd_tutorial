FROM ubuntu:latest

MAINTAINER Tuan Thai "tuanthai@example.com"

# Update and install dependencies
RUN apt update -y && apt install -y python3-pip python3-dev build-essential python3-venv

# Set the working directory
WORKDIR /flask_app

# Add the application code
ADD . /flask_app

# Create a virtual environment
RUN python3 -m venv /venv

# Upgrade pip in the virtual environment
RUN /venv/bin/python -m pip install --upgrade pip

# Copy requirements.txt and install dependencies in the virtual environment
COPY requirements.txt .
RUN /venv/bin/pip install -r requirements.txt

# Set the entrypoint to the virtual environment's Python
ENTRYPOINT ["/venv/bin/python"]
CMD ["flask_docker.py"]
