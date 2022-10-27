#!/usr/bin/env bash
set -euo pipefail

regex='^[a-z]+:\/\/(.+):[0-9]+\/announce$'

format() {
    if [[ "$1" =~ $regex ]]; then
        echo "${BASH_REMATCH[1]}"
    fi
}

while read line; do
    format "$line"
done
