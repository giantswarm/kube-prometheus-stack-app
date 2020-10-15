#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

LAST_SYNC_COMMIT=$(git log -n1 --grep '^\[upstream-sync\]' --pretty='format:%h' helm/)
TMPDIR=$(mktemp -d)

UPSTREAM_ZIP_URL=${UPSTREAM_ZIP_URL:-"https://github.com/prometheus-community/helm-charts/archive/main.zip"}
UPSTREAM_CHART_DIR=${UPSTREAM_CHART_DIR:-"helm-charts-main/charts"}
UPSTREAM_CHART_NAME=${UPSTREAM_CHART_NAME:-"kube-prometheus-stack"}
LOCAL_CHART_NAME=${LOCAL_CHART_NAME:-"prometheus-operator-app"}

KEEP_TMPDIR=${KEEP_TMPDIR:-''}

clean_on_exit() {
  [[ -z "${KEEP_TMPDIR}" ]] && rm -rf ${TMPDIR}
}

curl -sL -o ${TMPDIR}/main.zip ${UPSTREAM_ZIP_URL}
unzip -d ${TMPDIR}/ ${TMPDIR}/main.zip ${UPSTREAM_CHART_DIR}/${UPSTREAM_CHART_NAME}/*


UPSTREAM_VERSION=$(cat ${TMPDIR}/${UPSTREAM_CHART_DIR}/${UPSTREAM_CHART_NAME}/Chart.yaml | awk '/^version:/ { print $2 }')

cp -a ${TMPDIR}/${UPSTREAM_CHART_DIR}/${UPSTREAM_CHART_NAME}/* helm/${LOCAL_CHART_NAME}/

git add helm/${LOCAL_CHART_NAME}/
git commit -m "[upstream-sync] Version ${UPSTREAM_VERSION}"

trap clean_on_exit EXIT