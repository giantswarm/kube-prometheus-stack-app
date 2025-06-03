# kube-prometheus-stack

![Version: 16.0.0](https://img.shields.io/badge/Version-16.0.0-informational?style=flat-square) ![AppVersion: v0.82.0](https://img.shields.io/badge/AppVersion-v0.82.0-informational?style=flat-square)

Giant Swarm's Prometheus Operator Deployment

**Homepage:** <https://github.com/giantswarm/kube-prometheus-stack-app>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| giantswarm/team-atlas | <team-atlas@giantswarm.io> |  |

## Source Code

* <https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack>

## Requirements

Kubernetes: `>=1.25.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts | kube-prometheus-stack | 72.3.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.imageRegistry | string | `"gsoci.azurecr.io"` |  |
| global.rbac.create | bool | `true` |  |
| global.rbac.pspEnabled | bool | `false` |  |
| kube-prometheus-stack.alertmanager.alertmanagerSpec.image.repository | string | `"giantswarm/alertmanager"` |  |
| kube-prometheus-stack.alertmanager.ingress.ingressClassName | string | `"nginx"` |  |
| kube-prometheus-stack.alertmanager.ingress.pathType | string | `"ImplementationSpecific"` |  |
| kube-prometheus-stack.alertmanager.ingressPerReplica.ingressClassName | string | `"nginx"` |  |
| kube-prometheus-stack.alertmanager.ingressPerReplica.pathType | string | `"ImplementationSpecific"` |  |
| kube-prometheus-stack.coreDns.enabled | bool | `true` |  |
| kube-prometheus-stack.coreDns.service.selector.k8s-app | string | `"coredns"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[0].regex | string | `"coredns_dns_(request_size_bytes_bucket|response_size_bytes_bucket)"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[1].action | string | `"replace"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[1].regex | string | `"coredns_cache_.*;([^,]*?,?)(?:(?:,?[\\d\\.]+\\.in-addr\\.arpa\\.)+)+(,?.*)"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[1].replacement | string | `"${1}__replaced__*.in-addr.__${2}"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[1].sourceLabels[1] | string | `"zones"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.metricRelabelings[1].targetLabel | string | `"zones"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.relabelings[0].replacement | string | `"coredns"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.relabelings[1].sourceLabels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| kube-prometheus-stack.coreDns.serviceMonitor.relabelings[1].targetLabel | string | `"node"` |  |
| kube-prometheus-stack.grafana.image.repository | string | `"giantswarm/grafana"` |  |
| kube-prometheus-stack.grafana.ingress.ingressClassName | string | `"nginx"` |  |
| kube-prometheus-stack.grafana.rbac.pspEnabled | bool | `false` |  |
| kube-prometheus-stack.grafana.sidecar.image.repository | string | `"giantswarm/k8s-sidecar"` |  |
| kube-prometheus-stack.kube-state-metrics.image.repository | string | `"giantswarm/kube-state-metrics"` |  |
| kube-prometheus-stack.kube-state-metrics.metricLabelsAllowlist[0] | string | `"cronjobs=[application.giantswarm.io/team, app.kubernetes.io/name]"` |  |
| kube-prometheus-stack.kube-state-metrics.metricLabelsAllowlist[1] | string | `"jobs=[application.giantswarm.io/team, app.kubernetes.io/name]"` |  |
| kube-prometheus-stack.kube-state-metrics.metricLabelsAllowlist[2] | string | `"daemonsets=[application.giantswarm.io/team, app.kubernetes.io/name, app.kubernetes.io/component, app.kubernetes.io/instance, giantswarm.io/service-type]"` |  |
| kube-prometheus-stack.kube-state-metrics.metricLabelsAllowlist[3] | string | `"deployments=[application.giantswarm.io/team, app.kubernetes.io/name, app.kubernetes.io/component, app.kubernetes.io/instance, giantswarm.io/service-type]"` |  |
| kube-prometheus-stack.kube-state-metrics.metricLabelsAllowlist[4] | string | `"nodes=[giantswarm.io/machine-pool, giantswarm.io/machine-deployment, ip, node.kubernetes.io/instance-type, topology.kubernetes.io/region, topology.kubernetes.io/zone]"` |  |
| kube-prometheus-stack.kube-state-metrics.metricLabelsAllowlist[5] | string | `"pods=[application.giantswarm.io/team, app.kubernetes.io/name, app.kubernetes.io/component, app.kubernetes.io/instance, giantswarm.io/service-type]"` |  |
| kube-prometheus-stack.kube-state-metrics.metricLabelsAllowlist[6] | string | `"statefulsets=[application.giantswarm.io/team, app.kubernetes.io/name, app.kubernetes.io/component, app.kubernetes.io/instance, giantswarm.io/service-type]"` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.egress[0].to[0].ipBlock.cidr | string | `"10.0.0.0/8"` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.egress[0].to[1].ipBlock.cidr | string | `"172.16.0.0/12"` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.egress[0].to[2].ipBlock.cidr | string | `"192.168.0.0/16"` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.egress[0].to[3].ipBlock.cidr | string | `"100.64.0.0/10"` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.enabled | bool | `true` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.flavor | string | `"kubernetes"` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.ingress[0].ports[0].port | int | `8080` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.ingress[0].ports[0].protocol | string | `"TCP"` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.ingress[0].ports[1].port | int | `8081` |  |
| kube-prometheus-stack.kube-state-metrics.networkPolicy.ingress[0].ports[1].protocol | string | `"TCP"` |  |
| kube-prometheus-stack.kube-state-metrics.podAnnotations."cluster-autoscaler.kubernetes.io/safe-to-evict" | string | `"true"` |  |
| kube-prometheus-stack.kube-state-metrics.podSecurityPolicy.enabled | bool | `false` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.enabled | bool | `true` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[0].action | string | `"drop"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[0].regex | string | `"kube_(.+_annotations|secret_type|pod_status_qos_class|pod_tolerations|pod_status_scheduled|replicaset_metadata_generation|replicaset_status_observed_generation|replicaset_annotations|replicaset_status_fully_labeled_replicas|.+_metadata_resource_version)"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[1].action | string | `"labeldrop"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[1].regex | string | `"image_id"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[2].action | string | `"replace"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[2].replacement | string | `"${1}"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[2].sourceLabels[0] | string | `"label_topology_kubernetes_io_region"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[2].targetLabel | string | `"region"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[3].action | string | `"replace"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[3].replacement | string | `"${1}"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[3].sourceLabels[0] | string | `"label_topology_kubernetes_io_zone"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[3].targetLabel | string | `"zone"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[4].action | string | `"labeldrop"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[4].regex | string | `"label_topology_kubernetes_io_region|label_topology_kubernetes_io_zone"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[5].action | string | `"replace"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[5].replacement | string | `"${1}"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[5].sourceLabels[0] | string | `"label_giantswarm_io_machine_deployment"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[5].targetLabel | string | `"nodepool"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[6].action | string | `"replace"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[6].replacement | string | `"${1}"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[6].sourceLabels[0] | string | `"label_giantswarm_io_machine_pool"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.metricRelabelings[6].targetLabel | string | `"nodepool"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.relabelings[0].replacement | string | `"kube-state-metrics"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.relabelings[1].sourceLabels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheus.monitor.relabelings[1].targetLabel | string | `"node"` |  |
| kube-prometheus-stack.kube-state-metrics.prometheusScrape | bool | `false` |  |
| kube-prometheus-stack.kube-state-metrics.rbac.extraRules[0].apiGroups[0] | string | `"autoscaling.k8s.io"` |  |
| kube-prometheus-stack.kube-state-metrics.rbac.extraRules[0].resources[0] | string | `"verticalpodautoscalers"` |  |
| kube-prometheus-stack.kube-state-metrics.rbac.extraRules[0].verbs[0] | string | `"list"` |  |
| kube-prometheus-stack.kube-state-metrics.rbac.extraRules[0].verbs[1] | string | `"watch"` |  |
| kube-prometheus-stack.kube-state-metrics.resources.limits.cpu | string | `"2000m"` |  |
| kube-prometheus-stack.kube-state-metrics.resources.limits.memory | string | `"200Mi"` |  |
| kube-prometheus-stack.kube-state-metrics.resources.requests.cpu | string | `"200m"` |  |
| kube-prometheus-stack.kube-state-metrics.resources.requests.memory | string | `"200Mi"` |  |
| kube-prometheus-stack.kube-state-metrics.selfMonitor.enabled | bool | `true` |  |
| kube-prometheus-stack.kube-state-metrics.verticalPodAutoscaler.enabled | bool | `true` |  |
| kube-prometheus-stack.kube-state-metrics.verticalPodAutoscaler.minAllowed.cpu | string | `"200m"` |  |
| kube-prometheus-stack.kube-state-metrics.verticalPodAutoscaler.minAllowed.memory | string | `"200Mi"` |  |
| kube-prometheus-stack.kubeApiServer.enabled | bool | `true` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[0].regex | string | `"apiserver_request_duration_seconds_bucket;(0.15|0.2|0.3|0.35|0.4|0.45|0.6|0.7|0.8|0.9|1.25|1.5|1.75|2|3|3.5|4|4.5|6|7|8|9|15|25|40|50)"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[0].sourceLabels[1] | string | `"le"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[1].action | string | `"drop"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[1].regex | string | `"rest_client_(rate_limiter_duration_seconds_bucket|request_size_bytes_bucket|response_size_bytes_bucket)"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[2].action | string | `"drop"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[2].regex | string | `"apiserver_(longrunning_requests|watch_events_sizes_count|watch_events_sizes_sum|storage_list_fetched_objects_total|storage_list_total|storage_list_returned_objects_total)"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[2].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[3].action | string | `"drop"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[3].regex | string | `"apiserver_request_(slo_(duration_seconds_bucket|duration_seconds_sum)|duration_seconds_sum)"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[3].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[4].action | string | `"drop"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[4].regex | string | `"apiextensions_openapi_v2_regeneration_count|apiextensions_openapi_v3_regeneration_count"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.metricRelabelings[4].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.relabelings[0].replacement | string | `"kubernetes"` |  |
| kube-prometheus-stack.kubeApiServer.serviceMonitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.kubeControllerManager.enabled | bool | `true` |  |
| kube-prometheus-stack.kubeControllerManager.service.port | int | `10257` |  |
| kube-prometheus-stack.kubeControllerManager.service.selector.component | string | `"kube-controller-manager"` |  |
| kube-prometheus-stack.kubeControllerManager.service.targetPort | int | `10257` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.https | bool | `true` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.metricRelabelings[0].regex | string | `"rest_client_(rate_limiter_duration_seconds_bucket|request_size_bytes_bucket|response_size_bytes_bucket)"` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.relabelings[0].replacement | string | `"kube-controller-manager"` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.relabelings[1].sourceLabels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| kube-prometheus-stack.kubeControllerManager.serviceMonitor.relabelings[1].targetLabel | string | `"node"` |  |
| kube-prometheus-stack.kubeEtcd.enabled | bool | `true` |  |
| kube-prometheus-stack.kubeEtcd.serviceMonitor.relabelings[0].replacement | string | `"etcd"` |  |
| kube-prometheus-stack.kubeEtcd.serviceMonitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.kubeEtcd.serviceMonitor.relabelings[1].sourceLabels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| kube-prometheus-stack.kubeEtcd.serviceMonitor.relabelings[1].targetLabel | string | `"node"` |  |
| kube-prometheus-stack.kubeProxy.enabled | bool | `true` |  |
| kube-prometheus-stack.kubeProxy.serviceMonitor.relabelings[0].replacement | string | `"kube-proxy"` |  |
| kube-prometheus-stack.kubeProxy.serviceMonitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.kubeScheduler.enabled | bool | `true` |  |
| kube-prometheus-stack.kubeScheduler.service.port | int | `10259` |  |
| kube-prometheus-stack.kubeScheduler.service.selector.component | string | `"kube-scheduler"` |  |
| kube-prometheus-stack.kubeScheduler.service.targetPort | int | `10259` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.https | bool | `true` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.metricRelabelings[0].regex | string | `"rest_client_(rate_limiter_duration_seconds_bucket|request_size_bytes_bucket|response_size_bytes_bucket)"` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.relabelings[0].replacement | string | `"kube-scheduler"` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.relabelings[1].sourceLabels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| kube-prometheus-stack.kubeScheduler.serviceMonitor.relabelings[1].targetLabel | string | `"node"` |  |
| kube-prometheus-stack.kubeStateMetrics.enabled | bool | `true` |  |
| kube-prometheus-stack.kubelet.enabled | bool | `true` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].regex | string | `"container_cpu_(cfs_throttled_seconds_total|load_average_10s|system_seconds_total|user_seconds_total)"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].regex | string | `"container_fs_(io_current|io_time_seconds_total|io_time_weighted_seconds_total|reads_merged_total|sector_reads_total|sector_writes_total|writes_merged_total)"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].regex | string | `"container_memory_(mapped_file|swap)"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[3].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[3].regex | string | `"container_(file_descriptors|tasks_state|threads_max)"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[3].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[4].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[4].regex | string | `"container_spec.*"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[4].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].regex | string | `".+;"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].sourceLabels[0] | string | `"id"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[5].sourceLabels[1] | string | `"pod"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[6].action | string | `"labeldrop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[6].regex | string | `"id|name"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[7].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[7].regex | string | `"container_(blkio_device_usage_total|network_transmit_errors_total|network_receive_errors_total|memory_failures_total|memory_max_usage_bytes|memory_failcnt)"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorMetricRelabelings[7].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorRelabelings[0].action | string | `"replace"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorRelabelings[1].replacement | string | `"cadvisor"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.cAdvisorRelabelings[1].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.metricRelabelings[0].regex | string | `"rest_client_(rate_limiter_duration_seconds_bucket|request_size_bytes_bucket|response_size_bytes_bucket)"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.metricRelabelings[1].action | string | `"labeldrop"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.metricRelabelings[1].regex | string | `"uid"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.relabelings[0].action | string | `"replace"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.relabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.relabelings[0].targetLabel | string | `"metrics_path"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.relabelings[1].replacement | string | `"kubelet"` |  |
| kube-prometheus-stack.kubelet.serviceMonitor.relabelings[1].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.nodeExporter.enabled | bool | `false` |  |
| kube-prometheus-stack.prometheus-node-exporter.image.repository | string | `"giantswarm/node-exporter"` |  |
| kube-prometheus-stack.prometheus-node-exporter.rbac.pspEnabled | bool | `false` |  |
| kube-prometheus-stack.prometheus.ingress.ingressClassName | string | `"nginx"` |  |
| kube-prometheus-stack.prometheus.ingress.pathType | string | `"ImplementationSpecific"` |  |
| kube-prometheus-stack.prometheus.ingressPerReplica.ingressClassName | string | `"nginx"` |  |
| kube-prometheus-stack.prometheus.ingressPerReplica.pathType | string | `"ImplementationSpecific"` |  |
| kube-prometheus-stack.prometheus.prometheusSpec.image.repository | string | `"giantswarm/prometheus"` |  |
| kube-prometheus-stack.prometheus.thanosIngress.ingressClassName | string | `"nginx"` |  |
| kube-prometheus-stack.prometheus.thanosIngress.pathType | string | `"ImplementationSpecific"` |  |
| kube-prometheus-stack.prometheusOperator.admissionWebhooks.patch.image.repository | string | `"giantswarm/ingress-nginx-kube-webhook-certgen"` |  |
| kube-prometheus-stack.prometheusOperator.alertmanagerDefaultBaseImage | string | `"giantswarm/alertmanager"` |  |
| kube-prometheus-stack.prometheusOperator.enabled | bool | `true` |  |
| kube-prometheus-stack.prometheusOperator.env.GOGC | string | `"75"` |  |
| kube-prometheus-stack.prometheusOperator.image.repository | string | `"giantswarm/prometheus-operator"` |  |
| kube-prometheus-stack.prometheusOperator.networkPolicy.enabled | bool | `true` |  |
| kube-prometheus-stack.prometheusOperator.podAnnotations."cluster-autoscaler.kubernetes.io/safe-to-evict" | string | `"true"` |  |
| kube-prometheus-stack.prometheusOperator.prometheusConfigReloader.image.repository | string | `"giantswarm/prometheus-config-reloader"` |  |
| kube-prometheus-stack.prometheusOperator.prometheusDefaultBaseImage | string | `"giantswarm/prometheus"` |  |
| kube-prometheus-stack.prometheusOperator.secretFieldSelector | string | `"type!=helm.sh/release.v1"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[0].sourceLabels[0] | string | `"__meta_kubernetes_pod_label_app_kubernetes_io_name"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[0].targetLabel | string | `"app"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[1].sourceLabels[0] | string | `"__meta_kubernetes_pod_label_app_kubernetes_io_instance"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[1].targetLabel | string | `"instance"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[2].sourceLabels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[2].targetLabel | string | `"node"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[3].sourceLabels[0] | string | `"__meta_kubernetes_pod_label_application_giantswarm_io_team"` |  |
| kube-prometheus-stack.prometheusOperator.serviceMonitor.relabelings[3].targetLabel | string | `"team"` |  |
| kube-prometheus-stack.prometheusOperator.strategy.type | string | `"Recreate"` |  |
| kube-prometheus-stack.prometheusOperator.thanosImage.repository | string | `"giantswarm/thanos"` |  |
| kube-prometheus-stack.prometheusOperator.verticalPodAutoscaler.enabled | bool | `true` |  |
| kube-prometheus-stack.thanosRuler.enabled | bool | `false` |  |
| kube-prometheus-stack.thanosRuler.ingress.ingressClassName | string | `"nginx"` |  |
| kube-prometheus-stack.thanosRuler.ingress.pathType | string | `"ImplementationSpecific"` |  |
| kube-prometheus-stack.thanosRuler.thanosRulerSpec.image.repository | string | `"giantswarm/thanos"` |  |
| kyvernoPolicyExceptions.enabled | bool | `true` |  |
| kyvernoPolicyExceptions.namespace | string | `"giantswarm"` |  |

