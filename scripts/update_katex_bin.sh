#!/bin/bash
PROJECT_DIR=$PWD
cd ../KaTeX
git pull
TAG=$(git tag -l --sort=taggerdate | grep -E "^v[0-9]+\.[0-9]+.[0-9]+$" | tail -n 1)
git checkout $TAG
rm -f cli-linux
rm -f cli-macos
rm -f cli-win.exe
pkg cli.js

BIN=$PROJECT_DIR/src/markdown_katex/bin
mkdir -p $BIN
mv cli-linux $BIN/katex_$TAG_x86_64-Linux
mv cli-macos $BIN/katex_$TAG_x86_64-Darwin
mv cli-win.exe $BIN/katex_$TAG_x86_64-Windows

ls -l $BIN/*
file $BIN/*
