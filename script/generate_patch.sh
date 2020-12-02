#!/bin/bash
#
# This script generate the prometheus-operator helm chart
# It does so by pulling the upstream chart and apply patches on top

# prometheus-operator upstream git repository url
upstream_repo_url="https://github.com/prometheus-community/helm-charts.git"

# Path to helm chart in the prometheus-operator upstream repository
upstream_chart_path="charts/kube-prometheus-stack/"

# Path to helm chart in this repository, relative to this script
local_chart_path="../helm/prometheus-operator-app/"
# Path to patch files in this repository, relative to this script
patch_files="../patch/*.patch"

# Path to ignored files list, relative to this script
ignored_files="ignored_files"

ref="$1"

# Exit on error
set -eu
# Expand filename pattern to null when no files are found
shopt -s nullglob

script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
tmp=$(mktemp -d)
# Clean temporary directory on exit
trap "rm -rf $tmp" EXIT

echo "=====> fetching upstream chart" >&2
extra_arg=""
if [ -n "$ref" ]; then extra_arg+="--branch $ref"; fi
git -c advice.detachedHead=false clone --depth 1 $extra_arg $upstream_repo_url $tmp

echo "=====> syncing chart" >&2
rsync -qav --delete --exclude-from=$script_path/$ignored_files $tmp/$upstream_chart_path $script_path/$local_chart_path

echo "=====> generating patch" >&2
git -C $script_path/$local_chart_path diff --relative -R
git checkout $script_path/$local_chart_path

echo "=====> done" >&2
