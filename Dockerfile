FROM python:3.12-alpine

LABEL org.opencontainers.image.description="Deltadore Tydom to MQTT Bridge Garage"

# Add required packages
RUN apk add --no-cache gcc musl-dev linux-headers

# App base dir
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY /app/requirements.txt .
RUN pip install -r requirements.txt

# Copy app
COPY /app .
COPY /docs .

# Main command
CMD [ "python", "-u", "main.py" ]
