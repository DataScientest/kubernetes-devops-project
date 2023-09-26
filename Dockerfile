FROM python:3.8.10
 
WORKDIR /app
# Copy the Python script and all folder into working directory
COPY app.py /app
COPY requirements.txt /app
COPY routes/ /app/routes
COPY schemas/ /app/schemas
COPY models/ /app/models
COPY config/ /app/config
#It allows to copy the app.py file from the host (the directorywhere the Dockerfile is located) 
#to the /app directory inside the container.
 
RUN python -m pip install pip==20.0.2
# Install required Python libraries
RUN pip3 install --no-cache-dir -r requirements.txt
#The --no-cache-dir option is used to prevent caching the package index on the container, reducing the image size

EXPOSE 5000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]

# Run the Python script when the container is launching
#CMD [ "python3", "/app/app.py" ]
