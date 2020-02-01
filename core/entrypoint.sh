#!/bin/bash

service nginx start

cd core

if [ "$NODE_ENV" = "production" ]; then
  npm start
fi

if [ "$NODE_ENV" = "development" ]; then
  npm run start:dev
fi