# prometheus-operator-app

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![AppVersion: v0.60.1](https://img.shields.io/badge/AppVersion-v0.60.1-informational?style=flat-square)

**Homepage:** <https://github.com/giantswarm/prometheus-operator-app>

## Prerequisites

- Helm v3

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts | prometheus-operator-app(kube-prometheus-stack) | 43.3.0 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| giantswarm/team-atlas | <team-atlas@giantswarm.io> |  |

## Description

Giant Swarm's Prometheus Operator Deployment

## Source Code

* <https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| prometheus-operator-app.alertmanager.alertmanagerSpec.image.repository | string | `"giantswarm/alertmanager"` |  |
| prometheus-operator-app.alertmanager.ingress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.alertmanager.ingress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.alertmanager.ingressPerReplica.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.alertmanager.ingressPerReplica.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.coreDns.service.selector.k8s-app | string | `"coredns"` |  |
| prometheus-operator-app.global.imageRegistry | string | `"docker.io"` |  |
| prometheus-operator-app.global.rbac.create | bool | `true` |  |
| prometheus-operator-app.global.rbac.pspEnabled | bool | `true` |  |
| prometheus-operator-app.grafana.ingress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.kubeStateMetrics.enabled | bool | `false` |  |
| prometheus-operator-app.nodeExporter.enabled | bool | `false` |  |
| prometheus-operator-app.prometheus.ingress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.prometheus.ingress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.prometheus.ingressPerReplica.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.prometheus.ingressPerReplica.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.prometheus.prometheusSpec.image.repository | string | `"giantswarm/prometheus"` |  |
| prometheus-operator-app.prometheus.thanosIngress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.prometheus.thanosIngress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.prometheusOperator.admissionWebhooks.patch.image.repository | string | `"giantswarm/ingress-nginx-kube-webhook-certgen"` |  |
| prometheus-operator-app.prometheusOperator.alertmanagerDefaultBaseImage | string | `"giantswarm/prometheus"` |  |
| prometheus-operator-app.prometheusOperator.image.repository | string | `"giantswarm/prometheus-operator"` |  |
| prometheus-operator-app.prometheusOperator.labels."giantswarm.io/monitoring_basic_sli" | string | `"true"` |  |
| prometheus-operator-app.prometheusOperator.networkPolicy.enabled | bool | `true` |  |
| prometheus-operator-app.prometheusOperator.prometheusConfigReloader.image.repository | string | `"giantswarm/prometheus-config-reloader"` |  |
| prometheus-operator-app.prometheusOperator.prometheusDefaultBaseImage | string | `"giantswarm/prometheus"` |  |
| prometheus-operator-app.prometheusOperator.secretFieldSelector | string | `"type!=helm.sh/release.v1"` |  |
| prometheus-operator-app.prometheusOperator.thanosImage.repository | string | `"giantswarm/thanos"` |  |
| prometheus-operator-app.prometheusOperator.verticalPodAutoscaler.enabled | bool | `true` |  |
| prometheus-operator-app.thanosRuler.ingress.ingressClassName | string | `"nginx"` |  |
| prometheus-operator-app.thanosRuler.ingress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus-operator-app.thanosRuler.thanosRulerSpec.image.repository | string | `"giantswarm/thanos"` |  |

## Installing the Chart

To install the chart with the app CR name `prometheus-operator`:

```yaml

```

### Upgrade

#### From 32.x to 43.x

Upgrade the [prometheus-operator-crd](https://github.com/giantswarm/prometheus-operator-crd) chart,
check Changelog: [32.x to 43.x](../../changelog/32.x_43.x.md)

#### From 23.x to 32.x

Upgrade the [prometheus-operator-crd](https://github.com/giantswarm/prometheus-operator-crd) chart,
check Changelog: [23.x to 32.x](../../changelog/23.x_32.x.md)
