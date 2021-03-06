#!/bin/bash -e

service nginx start

cd core

case "$NODE_ENV" in
  "production")
    npm run start:prod
    ;;

  "development")
    npm run start:dev
    ;;

  "test")
    while true; do sleep 1d; done
    ;;
esac