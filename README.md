[![CircleCI](https://circleci.com/gh/giantswarm/prometheus-operator-app.svg?style=shield)](https://circleci.com/gh/giantswarm/prometheus-operator-app)

# prometheus-operator-app chart

Giant Swarm offers a Prometheus Operator Managed App which can be installed in
tenant clusters. Here we define the Prometheus chart with its templates and
default configuration.

Be aware by default the CRDs are not installed in the cluster to avoid collisions with existing deployments of the chart. So in case it is the first time you install the chart set the parameter `prometheusOperator.createCustomResource` to `true` in you values configuration.

Alternatively you can create the necessary `CustomResourceDefinition`s manually on your cluster:
```
kubectl create -f https://raw.githubusercontent.com/helm/charts/master/stable/prometheus-operator/crds/crd-alertmanager.yaml
kubectl create -f https://raw.githubusercontent.com/helm/charts/master/stable/prometheus-operator/crds/crd-podmonitor.yaml
kubectl create -f https://raw.githubusercontent.com/helm/charts/master/stable/prometheus-operator/crds/crd-prometheus.yaml
kubectl create -f https://raw.githubusercontent.com/helm/charts/master/stable/prometheus-operator/crds/crd-prometheusrules.yaml
kubectl create -f https://raw.githubusercontent.com/helm/charts/master/stable/prometheus-operator/crds/crd-servicemonitor.yaml
kubectl create -f https://raw.githubusercontent.com/helm/charts/master/stable/prometheus-operator/crds/crd-thanosrulers.yaml
```

## Good to know

The default configuration of this chart ignores secrets of type `helm.sh/release.v1`. This can be changed by changing the value of `prometheusOperator.secretFieldSelector` in your values.yaml. Example:

```
prometheusOperator:
  secretFieldSelector: ""
```
