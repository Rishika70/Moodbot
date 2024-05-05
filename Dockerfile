FROM python:3.7-slim

RUN python -m pip install Rasa

# Set the working directory
WORKDIR /app

# Copy everything from the current directory into the container
COPY . .

RUN rasa train nlu

# Set the user to run, dont run as root
USER 1001

# Set Entrypoint for interactive shells
ENTRYPOINT ["rasa"]

# Command  to run when container is called to run.
CMD [ "run" , "--enable-api", "--port" , "8080"]
