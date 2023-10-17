#!/bin/bash
#
# This script generate the README.md in helm/kube-prometheus-stack helm chart

tag=$(git describe --tags --abbrev=0)

sed -i 's/\[\[ .Version \]\]/'"$tag"'/' ./helm/kube-prometheus-stack/Chart.yaml

docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest

git checkout ./helm/kube-prometheus-stack/Chart.yaml
