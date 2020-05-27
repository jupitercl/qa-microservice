#!/bin/sh
/usr/sbin/sshd -D & /usr/sbin/crond -f & java -jar microservice.jar