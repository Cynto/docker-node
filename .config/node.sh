#!/bin/sh

cd /app
npm init -y
npm install --save sequelize pg pg-hstore

node server.mjs