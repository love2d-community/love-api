#!/bin/bash
# Use this script to build the index.html out of a fixed clone rather
# than downloading it everytime
if [ ! -d "./api" ]; then
  git clone https://github.com/rm-code/love-api api
fi
lua html-generator.lua
mv index.html ../index.html
