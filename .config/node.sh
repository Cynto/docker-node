#!/bin/sh
chmod -R 777 /app

cd /app
npm init -y
npm install --save sequelize pg pg-hstore 
npm install -g nodemon


nodemon server.mjs