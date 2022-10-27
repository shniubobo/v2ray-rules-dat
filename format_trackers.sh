#!/usr/bin/env bash
set -euo pipefail

regex='^[a-z]+:\/\/([^:\/]+)(:[0-9]+)?\/.*$'
regex_ip='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

format() {
    if [[ "$1" =~ $regex ]]; then
        domain="${BASH_REMATCH[1]}"
        [[ "$domain" =~ $regex_ip ]] || echo "$domain"
    fi
}

while read line; do
    format "$line"
done
