#!/bin/sh
set -e

if type go >/dev/null 2>&1; then 
  go get github.com/x-motemen/ghq
fi
