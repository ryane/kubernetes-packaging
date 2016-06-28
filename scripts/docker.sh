#!/bin/bash

set -ex

docker pull hello-world
docker tag hello-world ryane/hello-world-test:0.1
docker images
cat scripts/images
<scripts/images xargs -r -n1 docker images --format "{{.Repository}}:{{.Tag}}"
<scripts/images xargs -r -n1 docker images --format "{{.Repository}}:{{.Tag}}" | xargs -r -n1 docker push
