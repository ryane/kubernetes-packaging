#!/bin/bash

set -ex

docker pull hello-world
docker tag hello-world ryane/hello-world-test:0.1
docker version
docker images
cat scripts/images

while read image; do
  docker images | grep "$image" | awk '{printf "%s:%s\n", $1, $2}' | xargs -r -n1 docker push
done < scripts/images
