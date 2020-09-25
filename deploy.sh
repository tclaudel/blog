#!/usr/bin/env bash
git pull origin master

rm -Rf ./public
hugo
git add .
git status
read -p "Continue ? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
DATE= date +'%d/%m/%y'
echo $DATE
git commit -m "deployed on $DATE"
git push origin master
