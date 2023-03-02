FROM ubuntu:jammy


WORKDIR /app
COPY .  /app

RUN apt-get update && \
    apt-get install -y curl openssl unzip

RUN curl -s https://rolesanywhere.amazonaws.com/releases/1.0.4/X86_64/Linux/aws_signing_helper -o /usr/local/bin/aws_signing_helper && \
    chmod +x /usr/local/bin/aws_signing_helper

RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

