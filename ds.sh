#!/usr/bin/env bash
if [[ -n "$1" ]]; then
  docker images | grep $1 | awk '{sum+=$NF} {print $0} END {print sum, "MB"}'
else
  docker images | awk '{sum+=$NF} {print $0} END {print sum, "MB"}'
fi
