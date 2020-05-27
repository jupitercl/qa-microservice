#!/bin/sh

status_code=$(wget --server-response localhost:8080  2>&1 | awk '/^  HTTP/{print $2}')

if [[ "$status_code" -eq 200 ]] ; then
  echo "Site status is OK"
else
  echo "Site status changed to $status_code"
fi