# Contributing Guidelines

## Upgrading

* change the `kube-prometheus-stack` upstream version in Chart dependencies (`helm/prometheus-operator-app/Chart.yaml`)
* run `helm dependency update helm/prometheus-operator-app` to update the Chart.lock file
* re-generate `helm/prometheus-operator-app/values.schema.json`:
  * `helm schema-gen helm/prometheus-operator-app/values.yaml > helm/prometheus-operator-app/values.schema.json` to re-generate the file.
  * `sed -i 's/"type": "null"/"type": ["string", "null"]/g' helm/prometheus-operator-app/values.schema.json` to accept strings for all null values.
* update the link in the `Configuration` section of the Readme to point to the new tag configuration.
