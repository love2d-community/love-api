#!/bin/bash
rm -rf api
git clone https://github.com/rm-code/love-api api
lua html-generator.lua
mv index.html ../index.html
rm -rf api
