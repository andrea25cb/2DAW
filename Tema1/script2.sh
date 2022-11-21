#!/bin/bash
grep -q -w "$1" /etc/hosts
if [ $? -eq 0 ]
then
  echo "THE DOMAIN ALREADY EXISTS"
else
  echo "$2 $1" >> /etc/hosts
echo "THE DOMAIN $1 WITH IP $2 IS ADDED"
fi
