#!/usr/bin/env bash
if [[ -n "$1" ]]; then
  docker images | grep $1 | awk '{print $3}'
else
  docker images | awk '{print $3}'
fi
