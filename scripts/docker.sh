#!/bin/bash

set -ex

docker pull hello-world
docker tag hello-world ryane/hello-world-test:0.1
docker images
cat scripts/images

while read image; do
  docker images --format "{{.Repository}}:{{.Tag}}" "$image" | xargs -r -n1 docker push
done < scripts/images
