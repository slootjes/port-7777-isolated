#!/bin/bash

environment="$1"
shift

: "${REGION:=eu-west-1}"
if [ -z ${OPTIONS+x} ]; then
    OPTIONS=()
fi

if [ ! -f .env."$environment" ]; then
    echo "Error: Env file .env.$environment not found."
    exit 1
fi

export $(grep -v '^#' .env."$environment" | xargs)

while [[ $# -gt 0 ]]; do
    case "$1" in
        -r|--region)
            REGION="$2"
            shift 2
            ;;
        *)
            OPTIONS+=("$1")
            shift
            ;;
    esac
done

docker run --rm --name port7777 --env-file .env."$environment" -it -p 7777:7777 --platform linux/amd64 port7777/7777:1 --skip-install --verbose --region "$REGION" "${OPTIONS[@]}"
