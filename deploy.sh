#!/usr/bin/env bash

rm -Rf ./public
hugo
git add .
DATE= date +'%d/%m/%y'
echo $DATE
git commit -m "deployed on $DATE"
git push origin master
git push heroku master
