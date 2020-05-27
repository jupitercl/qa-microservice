FROM openjdk:8-jdk-alpine
# Get argument password
ARG PASS
# Create folder for microservice files
RUN mkdir /opt/microservice
ADD src /opt/microservice
WORKDIR /opt/microservice 
# Install OpenSSH and generate ssh key
RUN apk add --no-cache openssh \
  && mkdir /root/.ssh \
  && chmod 0700 /root/.ssh \
  && ssh-keygen -A \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:$PASS" | chpasswd

# Copy crontab definition
RUN chmod 0644 /opt/microservice/cron
RUN crontab /opt/microservice/cron

EXPOSE 8080 22

ENTRYPOINT ["/bin/sh", "start.sh"]