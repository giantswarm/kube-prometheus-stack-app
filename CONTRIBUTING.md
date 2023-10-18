# Contributing Guidelines

## Required tooling

- [Helm 3](https://helm.sh/docs/intro/install/): Most popular Kubernetes templating tool.
- [Helm Schema-gen](https://github.com/mihaisee/helm-schema-gen.git): can be installed using `helm plugin install https://github.com/mihaisee/helm-schema-gen.git`. This tool is used to generate the json schema of the helm chart

## Upgrading

* change the `kube-prometheus-stack` upstream version in Chart dependencies (`helm/kube-prometheus-stack/Chart.yaml`)
* run `helm dependency update helm/kube-prometheus-stack` to update the Chart.lock file
* re-generate `helm/kube-prometheus-stack/values.schema.json`:
  * `helm schema-gen helm/kube-prometheus-stack/values.yaml > helm/kube-prometheus-stack/values.schema.json` to re-generate the file.
  * `sed -i 's/"type": "null"/"type": ["string", "null"]/g' helm/kube-prometheus-stack/values.schema.json` to accept strings for all null values.
* update the link in the [`Configuration`](./README.md#configuration) section of the Readme to point to the new tag configuration.
