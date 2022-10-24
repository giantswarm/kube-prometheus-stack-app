#!/bin/bash
#
# This script generate the README.md in helm/prometheus-operator-app helm chart


tag=$(git describe --tags --abbrev=0)

sed -i 's/\[\[ .Version \]\]/'"$tag"'/' ./helm/prometheus-operator-app/Chart.yaml

docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest

git checkout ./helm/prometheus-operator-app/Chart.yaml
