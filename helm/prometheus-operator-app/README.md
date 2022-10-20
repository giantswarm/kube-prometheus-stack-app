# prometheus-operator-app

![Version: v1.3.1](https://img.shields.io/badge/Version-v1.3.1-informational?style=flat-square) ![AppVersion: v0.54.0](https://img.shields.io/badge/AppVersion-v0.54.0-informational?style=flat-square)

**Homepage:** <https://github.com/giantswarm/prometheus-operator-app>

## Prerequisites

- Helm v3

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts | prometheus-operator-app(kube-prometheus-stack) | 32.4.0 |

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
| prometheus-operator-app.alertmanager.alertmanagerSpec.image.repository | string | `"docker.io/giantswarm/alertmanager"` |  |
| prometheus-operator-app.alertmanager.ingress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.alertmanager.ingress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.alertmanager.ingressPerReplica.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.alertmanager.ingressPerReplica.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.grafana.ingress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.kubeStateMetrics.enabled | bool | `false` |  |
| prometheus-operator-app.prometheus.ingress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.prometheus.ingress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.prometheus.ingressPerReplica.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.prometheus.ingressPerReplica.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.prometheus.prometheusSpec.image.repository | string | `"docker.io/giantswarm/prometheus"` |  |
| prometheus-operator-app.prometheus.thanosIngress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.prometheus.thanosIngress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.prometheusOperator.admissionWebhooks.certManager.enabled | bool | `false` |  |
| prometheus-operator-app.prometheusOperator.admissionWebhooks.enabled | bool | `true` |  |
| prometheus-operator-app.prometheusOperator.admissionWebhooks.patch.enabled | bool | `true` |  |
| prometheus-operator-app.prometheusOperator.admissionWebhooks.patch.image.repository | string | `"docker.io/giantswarm/kube-webhook-certgen"` |  |
| prometheus-operator-app.prometheusOperator.admissionWebhooks.patch.image.sha | string | `""` |  |
| prometheus-operator-app.prometheusOperator.enabled | bool | `true` |  |
| prometheus-operator-app.prometheusOperator.image.repository | string | `"docker.io/giantswarm/prometheus-operator"` |  |
| prometheus-operator-app.prometheusOperator.prometheusConfigReloader.image.repository | string | `"docker.io/giantswarm/prometheus-config-reloader"` |  |
| prometheus-operator-app.prometheusOperator.prometheusDefaultBaseImage | string | `"docker.io/giantswarm/prometheus"` |  |
| prometheus-operator-app.prometheusOperator.resources.limits.cpu | string | `"200m"` |  |
| prometheus-operator-app.prometheusOperator.resources.limits.memory | string | `"200Mi"` |  |
| prometheus-operator-app.prometheusOperator.resources.requests.cpu | string | `"100m"` |  |
| prometheus-operator-app.prometheusOperator.resources.requests.memory | string | `"100Mi"` |  |
| prometheus-operator-app.prometheusOperator.secretFieldSelector | string | `"type!=helm.sh/release.v1"` |  |
| prometheus-operator-app.prometheusOperator.thanosImage.repository | string | `"docker.io/giantswarm/thanos"` |  |

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
