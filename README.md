# Prometheus Operator App

[![CircleCI](https://circleci.com/gh/giantswarm/prometheus-operator-app.svg?style=shield)](https://circleci.com/gh/giantswarm/prometheus-operator-app)

Giant Swarm offers Prometheus Operator as a [managed app](https://docs.giantswarm.io/changes/managed-apps/) which can be installed in any clusters.

**Table of Contents:**

- [Requirements](#requirements)
- [Install](#install)
- [Upgrading](#upgrading)
- [Configuration](#configuration)
- [Limitations](#limitations)
- [Credit](#credits)

## Requirements

In order to run this app and to be able to ensure smooth upgrades, we decided to split the CRDs from the application helm chart.
In this regard, you need to install the `prometheus-operator-crd` app compatible with the `prometheus-operator-app` version (same major version).

## Install

There are several ways to install this app onto a workload cluster.

- [Using GitOps to instantiate the App](https://docs.giantswarm.io/advanced/gitops/#installing-managed-apps)
- [Using our web interface](https://docs.giantswarm.io/ui-api/web/app-platform/#installing-an-app).
- By creating an [App resource](https://docs.giantswarm.io/ui-api/management-api/crd/apps.application.giantswarm.io/) in the management cluster as explained in [Getting started with App Platform](https://docs.giantswarm.io/app-platform/getting-started/).

## Upgrading

### Upgrading an existing Release to a new major version

A major chart version change (like v0.5.0 -> v1.0.0) indicates that there is an incompatible breaking change needing manual actions.

### From 3.x to 4.x

This version upgrades the kube-prometheus-stack chart from 44.x to 45.x and brings a small subset of changes (mainly upgrading prometheus-operator from 0.62 to 0.63 and a bunch of fixes).

### From 2.x to 3.x

This version upgrades the kube-prometheus-stack chart from 32.x to 44.x and brings along a lot of changes.

⚠️ The chart is enabling VPA and hence removing the configured resource requests and limits for the prometheus operator.

⚠️ If you are using the node-exporter subchart, you need to delete it prior to the upgrade as per https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack#from-39x-to-40x

#### Values diff:

In order to upgrade to 3.0.0, you should check the changes in values below and adapt yours accordingly.

Chart changes:

| Removed 🔴  | Description | Value | 
|-------------|--------------|--------|
| alertmanager.config.route.routes[0].match.alertname | string | `"Watchdog"` |
| defaultRules.rules.kubeApiserver | bool | `true` |
| defaultRules.rules.kubeScheduler | bool | `true` |
| kubeApiServer.serviceMonitor.metricRelabelings | list | `[]` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings | list | `[]` |

| Added 🟢    | Description | Value |
|-------------|------------|-------|
| alertmanager.alertmanagerSpec.alertmanagerConfiguration | object | `{}` |
| alertmanager.alertmanagerSpec.minReadySeconds | int | `0` |
| alertmanager.alertmanagerSpec.web | object | `{}` |
| alertmanager.config.inhibit_rules[0].equal[0] | string | `"namespace"` |
| alertmanager.config.inhibit_rules[0].equal[1] | string | `"alertname"` |
| alertmanager.config.inhibit_rules[0].source_matchers[0] | string | `"severity = critical"` |
| alertmanager.config.inhibit_rules[0].target_matchers[0] | string | `"severity =~ warning|info"` |
| alertmanager.config.inhibit_rules[1].equal[0] | string | `"namespace"` |
| alertmanager.config.inhibit_rules[1].equal[1] | string | `"alertname"` |
| alertmanager.config.inhibit_rules[1].source_matchers[0] | string | `"severity = warning"` |
| alertmanager.config.inhibit_rules[1].target_matchers[0] | string | `"severity = info"` |
| alertmanager.config.inhibit_rules[2].equal[0] | string | `"namespace"` |
| alertmanager.config.inhibit_rules[2].source_matchers[0] | string | `"alertname = InfoInhibitor"` |
| alertmanager.config.inhibit_rules[2].target_matchers[0] | string | `"severity = info"` |
| alertmanager.config.route.routes[0].matchers[0] | string | `"alertname =~ \"InfoInhibitor|Watchdog\""` |
| alertmanager.serviceMonitor.enableHttp2 | bool | `true` |
| cleanPrometheusOperatorObjectNames | bool | `false` |
| coreDns.serviceMonitor.additionalLabels | object | `{}` |
| defaultRules.additionalRuleAnnotations | object | `{}` |
| defaultRules.rules.kubeApiserverBurnrate | bool | `true` |
| defaultRules.rules.kubeApiserverHistogram | bool | `true` |
| defaultRules.rules.kubeControllerManager | bool | `true` |
| defaultRules.rules.kubeSchedulerAlerting | bool | `true` |
| defaultRules.rules.kubeSchedulerRecording | bool | `true` |
| global.rbac.createAggregateClusterRoles | bool | `false` |
| global.imageRegistry | string | `""`|
| grafana.sidecar.datasources.exemplarTraceIdDestinations | object | `{}` |
| grafana.sidecar.datasources.uid | string | `"prometheus"` |
| kubeApiServer.serviceMonitor.additionalLabels | object | `{}` |
| kubeApiServer.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |
| kubeApiServer.serviceMonitor.metricRelabelings[0].regex | string | `"apiserver_request_duration_seconds_bucket;(0.15|0.2|0.3|0.35|0.4|0.45|0.6|0.7|0.8|0.9|1.25|1.5|1.75|2|3|3.5|4|4.5|6|7|8|9|15|25|40|50)"` |
| kubeApiServer.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |
| kubeApiServer.serviceMonitor.metricRelabelings[0].sourceLabels[1] | string | `"le"` |
| kubeControllerManager.serviceMonitor.additionalLabels | object | `{}` |
| kubeDns.serviceMonitor.additionalLabels | object | `{}` |
| kubeEtcd.serviceMonitor.additionalLabels | object | `{}` |
| kubeProxy.serviceMonitor.additionalLabels | object | `{}` |
| kubeScheduler.serviceMonitor.additionalLabels | object | `{}` |
| kubelet.serviceMonitor.additionalLabels | object | `{}` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].action | string | `"drop"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].regex | string | `"container_cpu_(cfs_throttled_seconds_total|load_average_10s|system_seconds_total|user_seconds_total)"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].sourceLabels[0] | string | `"__name__"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].action | string | `"drop"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].regex | string | `"container_fs_(io_current|io_time_seconds_total|io_time_weighted_seconds_total|reads_merged_total|sector_reads_total|sector_writes_total|writes_merged_total)"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].sourceLabels[0] | string | `"__name__"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].action | string | `"drop"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].regex | string | `"container_memory_(mapped_file|swap)"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].sourceLabels[0] | string | `"__name__"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[3].action | string | `"drop"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[3].regex | string | `"container_(file_descriptors|tasks_state|threads_max)"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[3].sourceLabels[0] | string | `"__name__"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[4].action | string | `"drop"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[4].regex | string | `"container_spec.*"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[4].sourceLabels[0] | string | `"__name__"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].action | string | `"drop"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].regex | string | `".+;"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].sourceLabels[0] | string | `"id"` |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].sourceLabels[1] | string | `"pod"` |
| prometheus-node-exporter.releaseLabel | bool | `true` |
| prometheus.hostNetwork| bool | `false` |
| prometheus.prometheusSpec.additionalAlertRelabelConfigsSecret | object | `{}` |
| prometheus.prometheusSpec.additionalArgs | list | `[]` |
| prometheus.prometheusSpec.enableRemoteWriteReceiver | bool | `false` |
| prometheus.prometheusSpec.excludedFromEnforcement | list | `[]` |
| prometheus.prometheusSpec.exemplars | string | `""` |
| prometheus.prometheusSpec.minReadySeconds | int | `0` |
| prometheusOperator.admissionWebhooks.annotations | object | `{}` |
| prometheusOperator.admissionWebhooks.createSecretJob.securityContext | object | `{}` |
| prometheusOperator.admissionWebhooks.patch.annotations | object | `{}` |
| prometheusOperator.admissionWebhooks.patchWebhookJob.securityContext | object | `{}` |
| prometheusOperator.admissionWebhooks.timeoutSeconds | int | `10` |
| prometheusOperator.alertmanagerConfigNamespaces | list | `[]` |
| prometheusOperator.annotations | object | `{}` |
| prometheusOperator.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |
| prometheusOperator.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |
| prometheusOperator.labels | object | `{}` |
| prometheusOperator.networkPolicy.enabled | bool | `false` |
| prometheusOperator.serviceMonitor.additionalLabels | object | `{}` |
| prometheusOperator.verticalPodAutoscaler.controlledResources | list | `[]` |
| prometheusOperator.verticalPodAutoscaler.enabled | bool | `false` |
| prometheusOperator.verticalPodAutoscaler.maxAllowed | object | `{}` |
| prometheusOperator.verticalPodAutoscaler.minAllowed | object | `{}` |
| prometheusOperator.verticalPodAutoscaler.updatePolicy.updateMode | string | `"Auto"` |
| thanosRuler.annotations | object | `{}` |
| thanosRuler.enabled | bool | `false` |
| thanosRuler.extraSecret.annotations | object | `{}` |
| thanosRuler.extraSecret.data | object | `{}` |
| thanosRuler.ingress.annotations | object | `{}` |
| thanosRuler.ingress.enabled | bool | `false` |
| thanosRuler.ingress.hosts | list | `[]` |
| thanosRuler.ingress.labels | object | `{}` |
| thanosRuler.ingress.paths | list | `[]` |
| thanosRuler.ingress.tls | list | `[]` |
| thanosRuler.podDisruptionBudget.enabled | bool | `false` |
| thanosRuler.podDisruptionBudget.maxUnavailable | string | `""` |
| thanosRuler.podDisruptionBudget.minAvailable | int | `1` |
| thanosRuler.service.additionalPorts | list | `[]` |
| thanosRuler.service.annotations | object | `{}` |
| thanosRuler.service.clusterIP | string | `""` |
| thanosRuler.service.externalIPs | list | `[]` |
| thanosRuler.service.externalTrafficPolicy | string | `"Cluster"` |
| thanosRuler.service.labels | object | `{}` |
| thanosRuler.service.loadBalancerIP | string | `""` |
| thanosRuler.service.loadBalancerSourceRanges | list | `[]` |
| thanosRuler.service.nodePort | int | `30905` |
| thanosRuler.service.port | int | `10902` |
| thanosRuler.service.targetPort | int | `10902` |
| thanosRuler.service.type | string | `"ClusterIP"` |
| thanosRuler.serviceAccount.annotations | object | `{}` |
| thanosRuler.serviceAccount.create | bool | `true` |
| thanosRuler.serviceAccount.name | string | `""` |
| thanosRuler.serviceMonitor.bearerTokenFile | string | `nil` |
| thanosRuler.serviceMonitor.interval | string | `""` |
| thanosRuler.serviceMonitor.metricRelabelings | list | `[]` |
| thanosRuler.serviceMonitor.proxyUrl | string | `""` |
| thanosRuler.serviceMonitor.relabelings | list | `[]` |
| thanosRuler.serviceMonitor.scheme | string | `""` |
| thanosRuler.serviceMonitor.selfMonitor | bool | `true` |
| thanosRuler.serviceMonitor.tlsConfig | object | `{}` |
| thanosRuler.thanosRulerSpec.affinity | object | `{}` |
| thanosRuler.thanosRulerSpec.alertmanagersConfig | object | `{}` |
| thanosRuler.thanosRulerSpec.containers | list | `[]` |
| thanosRuler.thanosRulerSpec.evaluationInterval | string | `""` |
| thanosRuler.thanosRulerSpec.externalPrefix | string | `nil` |
| thanosRuler.thanosRulerSpec.image.repository | string | `"quay.io/thanos/thanos"` |
| thanosRuler.thanosRulerSpec.image.sha | string | `""` |
| thanosRuler.thanosRulerSpec.image.tag | string | `"v0.28.1"` |
| thanosRuler.thanosRulerSpec.initContainers | list | `[]` |
| thanosRuler.thanosRulerSpec.labels | object | `{}` |
| thanosRuler.thanosRulerSpec.listenLocal | bool | `false` |
| thanosRuler.thanosRulerSpec.logFormat | string | `"logfmt"` |
| thanosRuler.thanosRulerSpec.logLevel | string | `"info"` |
| thanosRuler.thanosRulerSpec.nodeSelector | object | `{}` |
| thanosRuler.thanosRulerSpec.objectStorageConfig | object | `{}` |
| thanosRuler.thanosRulerSpec.objectStorageConfigFile | string | `""` |
| thanosRuler.thanosRulerSpec.paused | bool | `false` |
| thanosRuler.thanosRulerSpec.podAntiAffinity | string | `""` |
| thanosRuler.thanosRulerSpec.podAntiAffinityTopologyKey | string | `"kubernetes.io/hostname"` |
| thanosRuler.thanosRulerSpec.podMetadata | object | `{}` |
| thanosRuler.thanosRulerSpec.portName | string | `"web"` |
| thanosRuler.thanosRulerSpec.priorityClassName | string | `""` |
| thanosRuler.thanosRulerSpec.queryConfig | object | `{}` |
| thanosRuler.thanosRulerSpec.queryEndpoints | list | `[]` |
| thanosRuler.thanosRulerSpec.replicas | int | `1` |
| thanosRuler.thanosRulerSpec.resources | object | `{}` |
| thanosRuler.thanosRulerSpec.retention | string | `"24h"` |
| thanosRuler.thanosRulerSpec.routePrefix | string | `"/"` |
| thanosRuler.thanosRulerSpec.ruleNamespaceSelector | object | `{}` |
| thanosRuler.thanosRulerSpec.ruleSelector | object | `{}` |
| thanosRuler.thanosRulerSpec.ruleSelectorNilUsesHelmValues | bool | `true` |
| thanosRuler.thanosRulerSpec.securityContext.fsGroup | int | `2000` |
| thanosRuler.thanosRulerSpec.securityContext.runAsGroup | int | `2000` |
| thanosRuler.thanosRulerSpec.securityContext.runAsNonRoot | bool | `true` |
| thanosRuler.thanosRulerSpec.securityContext.runAsUser | int | `1000` |
| thanosRuler.thanosRulerSpec.storage | object | `{}` |
| thanosRuler.thanosRulerSpec.tolerations | list | `[]` |
| thanosRuler.thanosRulerSpec.topologySpreadConstraints | list | `[]` |
| thanosRuler.thanosRulerSpec.volumeMounts | list | `[]` |
| thanosRuler.thanosRulerSpec.volumes | list | `[]` |

>  (-) stands for old value.
>  (+) stands for new value.

| Changed 🟡 | Description | Value |
|-------------|----------|----------|
| alertmanager.alertmanagerSpec.image.tag | string | (-) `"v0.23.0"` (+) `"v0.25.0"` |
| alertmanager.config.route.group_by[0] | string | (-) `"job"` (+) `"namespace"` |
| kubeEtcd.service.port | int | (-) `2379` (+) `2381`|
| kubeEtcd.service.targetPort | int | (-) `2379` (+) `2381`|
| prometheus.prometheusSpec.image.tag | string | (-) `"v2.33.1"` (+) `"v2.41.0"`|
| prometheus.prometheusSpec.walCompression | bool | (-) `false` (+) `true`|
| prometheusOperator.admissionWebhooks.patch.image.sha | string | (-) `"f3b6b39a6062328c095337b4cadcefd1612348fdd5190b1dcbcb9b9e90bd8068"` (+) `""` |
| prometheusOperator.admissionWebhooks.patch.image.tag | string | (-) `"v1.0"` (+) `"v1.3.0"`|
| prometheusOperator.image.tag | string | (-) `"v0.54.0"` (+) `"v0.62.0"` |
| prometheusOperator.prometheusConfigReloader.image.tag | string | (-) `"v0.54.0"` (+) `"v0.60.1"`|
| prometheusOperator.prometheusConfigReloader.resources.limits.cpu | string | (-) `"100m"` (+) `"200m"`|
| prometheusOperator.prometheusConfigReloader.resources.requests.cpu | string | (-) `"100m"` (+) `"200m"`|
| prometheusOperator.thanosImage.tag | string | (-) `"v0.24.0"` (+) `"v0.30.1"` |

### From 1.x to 2.x

This version upgrades the kube-prometheus-stack chart from 23.x to 32.x and brings along a lot of changes.

**⚠️ since we changed the way we package helm charts, Please make sure to nest all values under `prometheus-operator-app` ⚠️**

Example:

```yaml
# old values.yaml structure
defaultRules:
  rules:
    kubeProxy: true
prometheusOperator:
  image:
    tag: v0.54.0
```

```yaml
# new values.yaml structure
prometheus-operator-app:
  defaultRules:
    rules:
      kubeProxy: true
  prometheusOperator:
    image:
      tag: v0.54.0
```

#### Values diff:

In order to upgrade to 2.0.0, you should check the changes in values below and adapt yours accordingly.

- ⚠️ `nodeExporter` has been renamed to `prometheus-node-exporter`, However make sure to adapt the new structure below.
- ⚠️ `kubeStateMetrics` has been renamed to `kube-state-metrics`, However make sure to adapt the new structure below.

| Removed 🔴  |  Description | Value | 
|-------------|--------------|--------|
| `defaultRules.rules.kubeApiserverError` | Enable APIServer Error rules | `true` |
| `defaultRules.rules.kubePrometheusNodeAlerting` | Enable Prometheus node alerting  | `true` |
| `defaultRules.rules.kubernetesAbsent` | Enable kubernetesAbsent rule | `true`|
| `defaultRules.rules.time` | Enable time rule | `true` | 
| `kube-state-metrics.podSecurityPolicy.enabled` | Enables PSP for KSM | `true` |  
| `kubeStateMetrics.serviceMonitor.honorLabels` | honorLabels | `true` | 
| `kubeStateMetrics.serviceMonitor.interval` | Scrape interval | `""` | 
| `kubeStateMetrics.serviceMonitor.metricRelabelings` | list | `[]` | 
| `kubeStateMetrics.serviceMonitor.proxyUrl` | string | `""` | 
| `kubeStateMetrics.serviceMonitor.relabelings` | list | `[]` | 
| `kubeStateMetrics.serviceMonitor.scrapeTimeout` | string | `""` | 
| `kubeStateMetrics.serviceMonitor.selectorOverride` | object | `{}` | 
| `kubeStateMetrics.serviceMonitor.selfMonitor.enabled` | bool | `false` | 
| `nodeExporter.jobLabel` | job Label | `"jobLabel"` | 
| `nodeExporter.serviceMonitor.interval` | scrape interval | `""` | 
| `nodeExporter.serviceMonitor.metricRelabelings` | metric Relabelings | `[]` | 
| `nodeExporter.serviceMonitor.proxyUrl` | proxy url | `""` |  
| `nodeExporter.serviceMonitor.relabelings` | relabelings  | `[]` | 
| `nodeExporter.serviceMonitor.scrapeTimeout` | scrape Timeout | `""` | 
| `prometheus-node-exporter.extraArgs[0]` | extra Args | `"--collector.filesystem.ignored-mount-points=^/(dev|proc|sys|var/lib/docker/.+|var/lib/kubelet/.+)($|/)"` | 
| `prometheus-node-exporter.extraArgs[1]` | extra Args | `"--collector.filesystem.ignored-fs-types=^(autofs|binfmt_misc|bpf|cgroup2?|configfs|debugfs|devpts|devtmpfs|fusectl|hugetlbfs|iso9660|mqueue|nsfs|overlay|proc|procfs|pstore|rpc_pipefs|securityfs|selinuxfs|squashfs|sysfs|tracefs)$"` | 

| Added 🟢  |  Description | Value |
|-------------|------------|-------|
| `defaultRules.rules.configReloaders`| Enable configReloaders rules  | `true` |
| `defaultRules.rules.kubeProxy`  | Enable kubeProxu rules | `true` |
| `defaultRules.rules.nodeExporterAlerting` | Enable  nodeExporter alerting | `true` |
| `defaultRules.rules.nodeExporterRecording` | Enable nodeExporter recording  | `true` |
| `defaultRules.disabled` |    Disabled PrometheusRule alerts | `{}` |
| `alertmanager.service.externalTrafficPolicy` | Denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints | `Cluster` |
| `alertmanager.servicePerReplica.externalTrafficPolicy` | Denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints | `Cluster` |
| `grafana.rbac.pspEnabled` | If true, Grafana PSPs will be created | `false` |
| `grafana.sidecar.dashboards.labelValue` | configmap dashboards label value  | `"1"` |
| `grafana.sidecar.datasources.labelValue` | configmap datasources label value  | `"1"` |
| `grafana.serviceMonitor.enabled` | Enable servicemonitor for grafana | `true` |
| `grafana.serviceMonitor.labels` | labels for the ServiceMonitor | `{}` |
| `grafana.serviceMonitor.interval` | Scrape interval | `""` |
| `grafana.serviceMonitor.scheme` | Scheme of the endpoint | `http` |
| `grafana.serviceMonitor.tlsConfig` | Tls config for endpoint | `{}` |
| `grafana.serviceMonitor.scrapeTimeout` | Scrape timeout | `30s` |
| `kube-state-metrics.prometheus.monitor.enabled` | Enable Service monitor | `true` | 
| `kube-state-metrics.prometheus.monitor.honorLabels` | Labels for KSM monitor | `true` |
| `kube-state-metrics.prometheus.monitor.interval` | Scrape internal | `""` | 
| `kube-state-metrics.prometheus.monitor.metricRelabelings` | metricRelabelings list | `[]` | 
| `kube-state-metrics.prometheus.monitor.proxyUrl` | proxy url for the monitor | `""` | 
| `kube-state-metrics.prometheus.monitor.relabelings` | relabelings config | `[]` |
| `kube-state-metrics.prometheus.monitor.scrapeTimeout` | scrapeTimeout  | `""` | 
| `kube-state-metrics.releaseLabel` | KSM releaseLabel | `true` | 
| `kube-state-metrics.selfMonitor.enabled` | Enables selfMonitor | `false` | 
| `prometheus-node-exporter.extraArgs[0]` | Extra Args | `"--collector.filesystem.mount-points-exclude=^/(dev|proc|sys|var/lib/docker/.+|var/lib/kubelet/.+)($|/)"` | 
| `prometheus-node-exporter.extraArgs[1]` | Extra args | `"--collector.filesystem.fs-types-exclude=^(autofs|binfmt_misc|bpf|cgroup2?|configfs|debugfs|devpts|devtmpfs|fusectl|hugetlbfs|iso9660|mqueue|nsfs|overlay|proc|procfs|pstore|rpc_pipefs|securityfs|selinuxfs|squashfs|sysfs|tracefs)$"` | 
| `prometheus-node-exporter.prometheus.monitor.enabled` | Enables Service monitor  | `true` | 
| `prometheus-node-exporter.prometheus.monitor.interval` | Scrape interval | `""` | 
| `prometheus-node-exporter.prometheus.monitor.jobLabel` | job Label   | `"jobLabel"` | 
| `prometheus-node-exporter.prometheus.monitor.metricRelabelings` | metric Relabelings | `[]` | 
| `prometheus-node-exporter.prometheus.monitor.proxyUrl` | proxy Url | `""` | 
| `prometheus-node-exporter.prometheus.monitor.relabelings` | relabelings | `[]` | 
| `prometheus-node-exporter.prometheus.monitor.scrapeTimeout` | scrape Timeout | `""` | 
| `prometheus-node-exporter.rbac.pspEnabled` | Enables psp | `false` | 
| `prometheus.service.additionalPorts` |  Prometheus service additionalPorts | `[]` |
| `prometheus.service.externalTrafficPolicy` | Prometheus service externalTrafficPolicy  | `"Cluster"` |
| `prometheus.service.publishNotReadyAddresses` | publish NotReady Addresses | `false` | 
| `prometheus.servicePerReplica.externalTrafficPolicy` | Prometheus service per replica externalTrafficPolicy | `"Cluster"`| 
| `prometheus.thanosService.externalTrafficPolicy` | thanos Service externalTrafficPolicy | `"Cluster"` |
| `prometheus.thanosServiceExternal.externalTrafficPolicy` | thanos Service external externalTrafficPolicy | `"Cluster"` | 
| `prometheusOperator.admissionWebhooks.certManager.admissionCert.duration` | duration of cert | `""` | 
| `prometheusOperator.admissionWebhooks.certManager.rootCert.duration` | duration of root cert | `""` | 
| `prometheusOperator.service.externalTrafficPolicy` | Operator service externalTrafficPolicy  | `"Cluster"` | 

>  (-) stands for old value.
>  (+) stands for new value.

| Changed 🟡  | Description | Value |
|-------------|----------|----------|
| `defaultRules.runbookUrl` |    Prefix for runbook URLs.   |  `https://runbooks.prometheus-operator.dev/runbooks` |
| `global.rbac.pspEnabled` | Enabling PSP |  (-)`true` (+) `false` |
| `kubeControllerManager.service.port` | kube-cpntroller-manager service port  | (-) `10252`  (+) `nil` | 
| `kubeControllerManager.service.targetPort` |  kube-cpntroller-manager  target Port |   (-) `10252`   (+) `nil` | 
| `kubeControllerManager.serviceMonitor.https` | serviceMonitor https |  (-) `false`  (+) `nil` | 
| `kubeScheduler.service.port` | kube-scheduler service port | (-) `10251`    (+) `nil` | 
| `kubeScheduler.service.targetPort` |  kube-scheduler target port | (-) `10251`  (+) `nil` | 
| `kubeScheduler.serviceMonitor.https` | serviceMonitor https | (-) `false`  (+) `nil` | 
| `prometheus.prometheusSpec.image.tag` | Prometheus default image tag | (-) `"v2.31.1"`   (+) `"v2.33.1"` | 
| `prometheusOperator.image.tag` | default operator image tag |  (-) `"v0.52.1"`  (+) `"v0.54.0"` |
| `prometheusOperator.prometheusConfigReloader.image.tag` |  default prometheus Config Reloader image tag | (-) `"v0.52.1"`  (+) `"v0.54.0"` | 
| `prometheusOperator.thanosImage.tag` | default thanos image tag | (-)`"v0.23.1"`  (+) `"v0.24.0"` | 

## Configuration

By default, Prometheus Operator App is configured to scrape all targets equipped with a Service Monitor in the cluster it's deployed to.

`node-exporter` and `kube-state-metrics` are disabled by default because Giant Swarm provides them in their clusters but those components can be installed with:

```yaml
prometheus-operator-app:
  kubeStateMetrics:
    enabled: true
  nodeExporter:
    enabled: true
```
As this application is build upon the kube-prometheus-stack community driven upstream chart as a dependency, most of the values to override can be found [here](https://github.com/prometheus-community/helm-charts/blob/kube-prometheus-stack-44.2.0/charts/kube-prometheus-stack/values.yaml).

### Sample App CR and ConfigMap for the management cluster

If you have access to the Kubernetes API on the management cluster, you could create
the App CR and ConfigMap directly.

Here is an example that would install the app to
workload cluster `abc12`:

```yaml
# appCR.yaml
apiVersion: application.giantswarm.io/v1alpha1
kind: App
metadata:
  labels:
  name: prometheus-operator-app
  # workload cluster resources live in a namespace with the same ID as the
  # workload cluster.
  namespace: abc12
spec:
  name: prometheus-operator-app
  namespace: prometheus-operator-app
  catalog: giantswarm
  version: 2.2.0
  userConfig:
    configMap:
      name: prometheus-operator-app-user-values
      namespace: abc12
```

```yaml
# user-values-configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-operator-app-user-values
  namespace: abc12
data:
  values: |
    prometheus-operator-app:
      kubeStateMetrics:
        enabled: true
      nodeExporter:
        enabled: true
```

See our [full reference on how to configure apps](https://docs.giantswarm.io/app-platform/app-configuration/) for more details.

### Good to know

The default configuration of this chart ignores secrets of type `helm.sh/release.v1` to ensure it does not consume too much ram for secrets it should not try to reconcile. 
This can be changed by changing the value of `prometheusOperator.secretFieldSelector` in your values.yaml. Example:

```yaml
prometheus-operator-app:
  prometheusOperator:
    secretFieldSelector: ""
```

## Limitations

The application and its default values have been tailored to work inside Giant Swarm clusters.
If you want to use it for any other scenario, know that you might need to adjust some values.

## Credit

This application is installing the upstream chart below with defaults to ensure it runs smoothly in Giant Swarm clusters.

* <https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack>
