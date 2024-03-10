FROM ubuntu:latest

# Create the required folder and set permissions
RUN mkdir -p /structure && chmod 777 /structure

# Switch to root to create files with specific users and permissions
USER root

# Create files with specific users and permissions
RUN touch /structure/sync-work && chown sync /structure/sync-work
RUN touch /structure/nobody-work && chown nobody /structure/nobody-work

# Create user collin with UID 5000
RUN useradd -u 5000 collin

USER collin

CMD ["sh", "-c", "while true; do echo users; done"]