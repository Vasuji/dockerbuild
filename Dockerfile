# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container to /app
WORKDIR ./

COPY hello.py ./hello.py

# Set the command to be executed when launching a container from this image
CMD ["python", "hello.py"]
