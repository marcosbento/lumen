#!/usr/bin/env bash

set -e
set -x

timestamp=$(date +%Y%m%dT%H%M%S)

for image in $( find . | \grep 'Dockerfile' | sed 's|./\([^/]*\)/Dockerfile|\1|g' | sort -u )
do
    echo "Processing image: ${image}"

    full_image=marcosbento/lumen:${image}

    docker compose --profile development build "${image}"

    tagged_image="${full_image}_${timestamp}"
    docker tag "${full_image}" "${tagged_image}"

    docker push "${full_image}"
    docker push "${tagged_image}"
done