#!/bin/bash
sudo npm i -g npm
cd /mern-crud-project/frontend
npm i
npx prisma generate
npx prisma db push
