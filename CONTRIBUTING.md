# Contributing Guidelines

## Required tooling

- [Helm 3](https://helm.sh/docs/intro/install/): Most popular Kubernetes templating tool.
- [Helm Schema-gen](https://github.com/mihaisee/helm-schema-gen.git): can be installed using `helm plugin install https://github.com/mihaisee/helm-schema-gen.git`. This tool is used to generate the json schema of the helm chart

## Upgrading

* change the `kube-prometheus-stack` upstream version in Chart dependencies (`helm/prometheus-operator-app/Chart.yaml`)
* run `helm dependency update helm/prometheus-operator-app` to update the Chart.lock file
* re-generate `helm/prometheus-operator-app/values.schema.json`:
  * `helm schema-gen helm/prometheus-operator-app/values.yaml > helm/prometheus-operator-app/values.schema.json` to re-generate the file.
  * `sed -i 's/"type": "null"/"type": ["string", "null"]/g' helm/prometheus-operator-app/values.schema.json` to accept strings for all null values.
* update the link in the [`Configuration`](./README.md#configuration) section of the Readme to point to the new tag configuration.
