[![CircleCI](https://circleci.com/gh/giantswarm/prometheus-operator-app.svg?style=shield)](https://circleci.com/gh/giantswarm/prometheus-operator-app)

# prometheus-operator-app chart

Giant Swarm offers a Prometheus Operator Managed App which can be installed in
workload clusters. Here we define the Prometheus chart with its templates and
default configuration.

## CRD

### installation

The default `values.yaml` contains setting `crds.install: true` to install and update CRDs at installation and upgrade.

### release

CRDs are held in the `prometheus-operator-crd` chart which is released separatly from this repository and uses tag with `v*-crd` format.

## Good to know

The default configuration of this chart ignores secrets of type `helm.sh/release.v1`. This can be changed by changing the value of `prometheusOperator.secretFieldSelector` in your values.yaml. Example:

```
prometheusOperator:
  secretFieldSelector: ""
```
