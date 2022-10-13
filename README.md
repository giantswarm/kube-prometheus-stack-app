[![CircleCI](https://circleci.com/gh/giantswarm/prometheus-operator-app.svg?style=shield)](https://circleci.com/gh/giantswarm/prometheus-operator-app)

# prometheus-operator-app chart

Giant Swarm offers a Prometheus Operator Managed App which can be installed in
workload clusters. Here we define the Prometheus chart with its templates and
default configuration.

## Requirements

In order to run this app requires the following to be installed:

* prometheus-operator-crd 0.x.x

## Good to know

The default configuration of this chart ignores secrets of type `helm.sh/release.v1`. This can be changed by changing the value of `prometheusOperator.secretFieldSelector` in your values.yaml. Example:

```yaml
prometheusOperator:
  secretFieldSelector: ""
```

### Upgrade
#### From 1.3.x to 2.x

* Check [Changelog](https://github.com/giantswarm/prometheus-operator-app/CHANGELOG.md)

* **⚠️ Please be carefull with the new way of nesting values, check [update-changes](https://github.com/giantswarmprometheus-operator-app/changelog/23.x_32.x.md) for reference ⚠️**

* **⚠️ Consider using Giant Swarm node-exporter, grafana and kube-state-metrics managed apps, instead of enabling them in this chart ⚠️**
