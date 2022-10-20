#!/bin/bash
sudo npm i -g npm
npm i
npx prisma generate
npx prisma db push
