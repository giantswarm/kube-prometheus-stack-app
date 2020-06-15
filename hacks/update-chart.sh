#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

LAST_SYNC_COMMIT=$(git log -n1 --grep '^\[upstream-sync\]' --pretty='format:%h' helm/)
TMPDIR=$(mktemp -d)

UPSTREAM_ZIP_URL=${UPSTREAM_ZIP_URL:-"https://github.com/helm/charts/archive/master.zip"}
UPSTREAM_CHART_DIR=${UPSTREAM_CHART_DIR:-"charts-master/stable"}
UPSTREAM_CHART_NAME=${UPSTREAM_CHART_NAME:-"prometheus-operator"}

KEEP_TMPDIR=${KEEP_TMPDIR:-''}

clean_on_exit() {
  [[ -z "${KEEP_TMPDIR}" ]] && rm -rf ${TMPDIR}
}

curl -sL -o ${TMPDIR}/master.zip ${UPSTREAM_ZIP_URL}
unzip -d ${TMPDIR}/ ${TMPDIR}/master.zip ${UPSTREAM_CHART_DIR}/${UPSTREAM_CHART_NAME}/*


UPSTREAM_VERSION=$(cat ${TMPDIR}/${UPSTREAM_CHART_DIR}/${UPSTREAM_CHART_NAME}/Chart.yaml | awk '/^version:/ { print $2 }')

cp -a ${TMPDIR}/${UPSTREAM_CHART_DIR}/${UPSTREAM_CHART_NAME}/* helm/${UPSTREAM_CHART_NAME}-app/

git add helm/${UPSTREAM_CHART_NAME}-app/
git commit -m "[upstream-sync] Version ${UPSTREAM_VERSION}"

trap clean_on_exit EXIT