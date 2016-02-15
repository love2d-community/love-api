#!/bin/bash
rm -rf api
git clone https://github.com/rm-code/love-api api
lua html-generator.lua
mv 0.10.0.html ../index.html
rm -rf api
