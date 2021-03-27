FROM alpine

# Install required Wodby CLi Tool
RUN wget -O wodby.tar.gz  https://s3.amazonaws.com/wodby-releases/wodby-cli/0.1.5/linux/amd64/wodby-linux-amd64.tar.gz && \
    tar xz -f wodby.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/wodby && \
    rm wodby.tar.gz

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]