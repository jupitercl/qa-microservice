#!/bin/sh
for PID in $(ps -ef | grep "microservice.jar" | awk '{print $1}'); do kill -9 $PID; done