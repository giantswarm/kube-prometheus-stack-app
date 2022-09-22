# prometheus-operator-app

![Version: 32.4.0](https://img.shields.io/badge/Version-32.4.0-informational?style=flat-square) ![AppVersion: v0.54.0](https://img.shields.io/badge/AppVersion-v0.54.0-informational?style=flat-square)

**Homepage:** <https://github.com/giantswarm/prometheus-operator-app>

## Prerequisites

- Helm v3

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts | prometheusOperator(kube-prometheus-stack) | 32.4.0 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Mohamed Chiheb Ben Jemaa | <mohamed@giantswarm.io> |  |

## Description

Giant Swarm's Prometheus Operator Deployment

## Source Code

* <https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| isManagementCluster | bool | `true` |  |
| prometheusOperator.alertmanager.enabled | bool | `false` |  |
| prometheusOperator.coreDns.enabled | bool | `false` |  |
| prometheusOperator.defaultRules.create | bool | `false` |  |
| prometheusOperator.grafana.enabled | bool | `false` |  |
| prometheusOperator.kubeApiServer.enabled | bool | `false` |  |
| prometheusOperator.kubeControllerManager.enabled | bool | `false` |  |
| prometheusOperator.kubeEtcd.enabled | bool | `false` |  |
| prometheusOperator.kubeProxy.enabled | bool | `false` |  |
| prometheusOperator.kubeScheduler.enabled | bool | `false` |  |
| prometheusOperator.kubeStateMetrics.enabled | bool | `false` |  |
| prometheusOperator.kubelet.enabled | bool | `false` |  |
| prometheusOperator.nodeExporter.enabled | bool | `false` |  |
| prometheusOperator.prometheus.enabled | bool | `false` |  |
| prometheusOperator.prometheusOperator.configReloaderCpu | string | `"25m"` |  |
| prometheusOperator.prometheusOperator.createCustomResource | bool | `false` |  |
| prometheusOperator.prometheusOperator.kubeletService.enabled | bool | `false` |  |
| prometheusOperator.prometheusOperator.prometheusDefaultBaseImage | string | `"giantswarm/prometheus"` |  |
| prometheusOperator.prometheusOperator.resources.limits.memory | string | `"500Mi"` |  |
| prometheusOperator.prometheusOperator.resources.requests.memory | string | `"250Mi"` |  |

## Installing the Chart

To install the chart with the app CR name `prometheus-operator`:

```yaml

```

### Upgrade

#### From 23.x to 32.x

Upgrade the [prometheus-operator-crd](https://github.com/giantswarm/prometheus-operator-crd) chart,
check Changelog: [23.x to 32.x](../../changelog/23.x_32.x.md)

## Develop

### Upgrade the upstream Chart.

- First check the changelog in upstream and take notes

- Then, find a suitable version.

- Add values diff changelog into `changelog` folder.

- Update `Chart.yaml`:
  - dependencies
  - version
  - appVersion

- Run `helm dependency update`

- Adjust values (If applicable)
  - Adjust Root Values
  - Adjust Values in [config repo](https://github.com/giantswarm/config)

- Update docs with `helm-docs`

- Test the Upgrade.

- Release a new app version

- Annonce the change to our customers.

### Update documentation

Chart documentation is generated with [helm-docs](https://github.com/norwoodj/helm-docs) from `values.yaml` file.
After file modification, regenerate README.md with command:

```bash
docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest
```

