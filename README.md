[![CircleCI](https://circleci.com/gh/giantswarm/prometheus-operator-app.svg?style=shield)](https://circleci.com/gh/giantswarm/prometheus-operator-app)

# prometheus-operator-app

Giant Swarm offers a Prometheus Operator Managed App which can be installed in
workload clusters. Here we define the Prometheus chart with its templates and
default configuration.

## Requirements

In order to run this app and to be able to ensure smooth upgrades, we decided to split the CRDs from the application helm chart.
In this regard, you need to install the `prometheus-operator-crd` app compatible with the `prometheus-operator-app` version (same major version).

## Good to know

The default configuration of this chart ignores secrets of type `helm.sh/release.v1`. This can be changed by changing the value of `prometheusOperator.secretFieldSelector` in your values.yaml. Example:

```yaml
prometheusOperator:
  secretFieldSelector: ""
```

### Upgrade

#### From 2.x to 3.x

* Check [Changelog](https://github.com/giantswarm/prometheus-operator-app/blob/main/CHANGELOG.md).

* **⚠️ Please check the [breaking changes](https://github.com/giantswarm/prometheus-operator-app/changelog/32.x_42.x.md) ⚠️**

#### From 1.3.x to 2.x

* Check [Changelog](https://github.com/giantswarm/prometheus-operator-app/blob/main/CHANGELOG.md)

* **⚠️ Please be careful with the new way of nesting values, check [update-changes](https://github.com/giantswarm/prometheus-operator-app/changelog/23.x_32.x.md) ⚠️**

* **⚠️ Consider using Giant Swarm node-exporter, grafana and kube-state-metrics managed apps, instead of enabling them in this chart ⚠️**
